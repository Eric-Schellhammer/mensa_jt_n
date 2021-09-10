import 'package:flutter/material.dart';

class InfosRahmenprogramm extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos Rahmenprogramm"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //damit linksbündig
              children: <Widget>[
              Text("Wertgutscheine und wie sie funktionieren",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('Zum JT 2020 gibt es in einigen Lokalen Wertgutscheine: Hier wählt Ihr bei der Buchung nur das gewünschte Abendessen. '
                  'Dort steht auch jeweils der Preis des Essens, welcher Euch dann auf Euren Wertgutschein angerechnet wird. Dieser ist im Buchungspreis enthalten.\n\n'
                  '- D.h. wenn ein Gericht bei der Buchung 12,80 Euro kostet, habt Ihr bei einem Wertgutschein in Höhe von 15 Euro vor Ort noch '
                  '2,20 Euro für weitere Speisen zur Verfügung. Und nicht nur das: Der restliche Betrag des Wertgutscheines kann auch für '
                  'Getränke angerechnet werden!\n\n'
                  '- Wenn ein Gericht bspw. 16,90 Euro kostet, bezahlt Ihr mit Eurem Wertgutschein in Höhe von 15 Euro und legt den '
                  'Differenzbetrag in Höhe von 1,90 Euro einfach bar auf den Tisch. Natürlich freut sich das Servicepersonal aber auch über ein '
                  'angemessenes Trinkgeld.\n\n'
                  'Ob Ihr ein Event mit Wertgutschein bucht, steht bei der individuellen Buchungsseite geschrieben. Bitte daher genau lesen. Dort '
                  'stehen auch weitere Hinweise wie "EC-Karten-Zahlung möglich ab welchem Betrag", "bis wann hat die Küche geöffnet" etc.',
                style: TextStyle(fontSize: 15.0, )
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Einlass, vor allem bei den Abendveranstaltungen ( ! ), gibt es nur gegen Ticket - und das solltet Ihr dabei haben, damit Ihr auch '
                'wieder wisst, was Ihr essen werdet an dem Abend!',
                style: TextStyle(fontSize: 15.0, color: Colors.red[700])
              ),
              SizedBox(
                height: 20.0,
              ),              
              
              Text("Essenszeiten",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ), 
              SizedBox(
                height: 20.0,
              ),       
              // hier anpassen!     
              Text('Wir haben versucht den oftmals kleinen Küchen der Lokale entgegenzukommen und Euch auf verschiedene Ankunftsuhrzeiten zu verteilen. '
                    'So solltet Ihr alle schneller Euren Hunger und Durst stillen können, weil sich das Restaurant auf Eure Ankunft vorbereiten kann. Ihr '
                    'müsst aber nicht früher gehen, wenn Ihr beispielsweis die "Frühschicht" gebucht habt - Euer Platz ist Euch sicher, egal zu welcher '
                    'Uhrzeit Ihr ankommt. ',
                style: TextStyle(fontSize: 15.0, )
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