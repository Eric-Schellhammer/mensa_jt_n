import 'package:flutter/material.dart';
//import 'home.dart';
import 'listAllEvents.dart';

class EventPerDay extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    List<String> allEventDays = ["Mittwoch", "Donnerstag", "Freitag", "Samstag", "Sonntag"];

    return Scaffold(

      appBar: AppBar(
        title: Text("Events nach Tagen"),
      ), 
      body: 
      ListView.builder(
        itemCount: allEventDays.length,
        padding: const EdgeInsets.all(12.5),         
        itemBuilder: (context, dayIndex) {
          return 
            Card(
              child: ListTile(
              title: Text(allEventDays[dayIndex]),
                onTap: () { 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListViewEvents(specDay: allEventDays[dayIndex], specCategory: "all",)),
                  );
                },
              ),
            );         
        }
      )
    );
  }
} 