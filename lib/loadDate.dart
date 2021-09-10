import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'event.dart';
import 'globals.dart';
import 'databaseHelper.dart';

Future<List<Event>> fetchPosts(http.Client client) async {
  final response = await client.get('https://event-orga.mensa.de/getAppJSON.php?jt=jt2020');

  return compute(parsePosts, response.body);
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
      
          ? Center(child: Text("Daten wurden geladen",
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