import 'package:flutter/material.dart';
//import 'home.dart';
import 'listAllEvents.dart';

class EventPerCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    
    List<String> categories = [
      "Rahmenprogramm",
      "Vortrag im Tagungshotel",
      "Workshop im Tagungshotel",
      "Spiel, Sport und Spaß",
      "Stadtführungen",
      "Besichtigungen und Ausflüge",
      "Geschichte, Kunst und Kultur",
      "Genuss",
      "Firmenbesichtigungen",
      "Vortrag / Workshop Außerhalb",
      //"Sonstiges Merchandise",
      //"ohne Tabelle (Merchandising etc.)",
      "Für Kinder",
      //"Selbstorga",
      //"Unknown",
      //"JT2020OrgaBeitrag",
    ];

    return Scaffold(

      appBar: AppBar(
        title: Text("Events nach Kategorie"),
      ), 
      body: 
      ListView.builder(
        itemCount: categories.length,
        padding: const EdgeInsets.all(12.5),         
        itemBuilder: (context, categIndex) {
          return 
            Card(
              child: ListTile(
              title: Text(categories[categIndex]),
                onTap: () { 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListViewEvents(specDay: "all", specCategory: categories[categIndex],)),
                  );
                },
              ),
            );         
          }
      )
    );
  }
} 