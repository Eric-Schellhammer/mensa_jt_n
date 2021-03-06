import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'databaseHelper.dart';
import 'event.dart';
import 'globals.dart';

Future<List<Event>> fetchPosts(http.Client client) async {
  final response = await client.get('https://event-orga.mensa.de/getAppJSON.php?jt=jt2020');

  return compute(parsePosts, response.body);
}

/// if the database is empty, insert events from local file into database
Future<void> initDbFromLocalFile() async {
  final DatabaseHelper dbHelper = new DatabaseHelper();
  dbHelper.getCount().then((count) {
    if (count == 0) {
      rootBundle.loadString("assets/data/jt20.json").then((localJson) => compute(parsePosts, localJson)).then((allEvents) {
        if (allEvents != null) {
          for (var index = 1; index < allEvents.length; index++) {
            dbHelper.insertEvent(allEvents[index]);
          }
        }
      });
    }
  });
}

List<Event> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Event>((json) => Event.fromJson(json)).toList();
}

class LoadData extends StatelessWidget {
  final String day;
  final String category;

  LoadData({Key key, this.day, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseHelper dbHelper = new DatabaseHelper();
    dbHelper.database;

    return Scaffold(
      appBar: AppBar(
        title: Text("Daten laden"),
      ),
      body: FutureBuilder<List<Event>>(
        future: fetchPosts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          allEvents = snapshot.data;

          // alle Events neu in DB abspeichern. Schon vorhandene werden ersetzt
          if (allEvents != null) {
            for (var index = 1; index < allEvents.length; index++) {
              dbHelper.insertEvent(allEvents[index]);
            }
          }

          return snapshot.hasData
              ? Center(
                  child: Text(
                  "Daten wurden geladen",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ))
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
