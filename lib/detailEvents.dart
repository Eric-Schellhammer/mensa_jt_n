import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'event.dart';
import 'package:intl/intl.dart';

class DetailEvents extends StatelessWidget {
  final Event event;
  DetailEvents({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //damit linksbündig
              children: <Widget>[
              Text(event.name, 
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 20.0,
              ),
              Html(
                data: event.bild!=""?"<div class=\"event-image\"><img alt=\"-\" class=\"size-full\" src=\"https:\/\/event-orga.mensa.de\/getImage.php?h=300&jt=jt2020&name=${event.bild}\">":"<div></div>",
              ), 
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Start: \t\t\t${DateFormat("dd.MM.   HH:mm").format(DateTime.tryParse(event.start))} Uhr\nDauer: \t${event.dauer} Minuten \n\nAbmarsch am Hotel: ${event.abmarsch.substring(0, 5)} \n\n",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
              ),
              Text(
                "Beschreibung:",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 20.0,
              ),
              Html(
                data: event.eventtext,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Barrierefreiheit: \n",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)

              ),
              Text(
                "Die Veranstaltung ist: ${event.barrierefreiheit}. \n\n",
                style: TextStyle(fontSize: 15.0)
              ),
              Text(
                "Veranstaltungsort: \n",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)

              ),
              Text(
                "${event.location} \n${event.strasse} \n${event.plz} ${event.ortsname}\n\nGebäude: ${event.gebaeude}\n",
                style: TextStyle(fontSize: 15.0)
              ),
              Text(
                "Koordinaten: ${event.koordLat}, ${event.koordLon} \n",
                style: TextStyle(fontSize: 15.0)
              ),
              Text(
                "Haltestelle: ${event.haltestelle}",
                style: TextStyle(fontSize: 15.0)
              ),
              SizedBox(
                height: 20.0,
              ),
            ]
          )
        )
      )

    );
  }

}