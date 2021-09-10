import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfosJT extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Allgemeines zum JT"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //damit linksbündig
              children: <Widget>[           
              Text("Allgemeine Informationen",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),

              Text("Hier findet ihr einen Überblick über alle Infos zum JT 2020 in Nürnberg.\n",
                style: TextStyle(fontSize: 15.0, )

              ),
              SizedBox(
                height: 10.0,
              ),  

              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlJtHome,
                  child: new Text('JT 2020 Homepage'),
                  color: Colors.lightGreen,
                ),
              ),

              SizedBox(
                height: 20.0,
              ),           
              Text("Tagungshotel",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text("Das Hotel \n\nNH Collection Nürnberg City\nBahnhofstraße 17-19\n90402 Nürnberg\n\n"
                "wird fünf Tage und vier Nächte lang der Mittelpunkt Eurer Mensa-Welt sein.\n",
                style: TextStyle(fontSize: 15.0, )
              ),
              SizedBox(
                height: 20.0,
              ),

              Text("Tagungsbüro",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ), 
              SizedBox(
                height: 20.0,
              ),
              Text('Im Tagungshotel haben Check-In, Info-Point sowie der Merchandising-Raum vom 09:00 - 18:00 Uhr geöffnet.\n'
                    'Am Mittwoch (15. April 2020) öffnen wir um 12:00 Uhr.\n'
                    'Am Samstag ist das Tagungsbüro geschlossen.\n\n'
                    'Da sich die Öffnungszeiten kurzfristig etwas ändern können, bitten wir euch vor Ort zu schauen was die aktuellen Zeiten sind.\n\n'
                    'In wichtigen Fällen erreicht ihr uns unter:\n(0173) 167 86 61',
                style: TextStyle(fontSize: 15.0, )              
              ), 
              SizedBox(
                height: 20.0,
              ),

              Text("Teilnahme an gebuchten Events",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ), 
              SizedBox(
                height: 20.0,
              ),
              Text('Einlass / Teilnahme am gebuchten Event, vor allem bei den Abendveranstaltungen ( ! ), gibt es nur gegen Ticket - und das solltet Ihr dabei haben!!\n'
                'Für die Abendveranstaltungen wisst ihr dadurch auch was ihr zu essen bestellt habt.',
                style: TextStyle(fontSize: 15.0, color: Colors.red[800]) //, fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 20.0,
              ),

              Text("Spielezimmer",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ), 
              SizedBox(
                height: 20.0,
              ),
              Text('Das Spielezimmer steht Euch während des JTs prinzipiell ab Mittwochnachmittag '
                    'zur Verfügung. Allerdings haben sich auch ein paar kleine Events hier reingeschlichen:'
                    '\n\n- NSP-Fragestunde am Freitag-Nachmittag'
                    '\n\n- LEGO-Schau am Donnerstag und Freitag Vormittag'
                    '\n\n- Buchvorstellungen zu den Themen "Hochbegabung" und "Georges Cuvier und die Katastrophen" Donnerstag und Freitag Vormittag'
                    '\n\nWir möchten Euch bitten, für die Dauer der Events den Raum bitte zu verlassen, sofern Ihr kein '
                    'Eintrittsticket für die Veranstaltungen habt. Die Zeiten stehen auch vor Ort auf der Eingangstür zum Spielezimmer.',
                style: TextStyle(fontSize: 15.0, )              
              ), 
              SizedBox(
                height: 20.0,
              ),

              Text("Mobilität",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ), 
              SizedBox(
                height: 20.0,
              ),            
              Text('Im Orgabeitrag enthalten ist ein Tagungsticket für den ÖPNV Nürnberg (VGN) während des Jahrestreffens '
                    '(15.-19. April 2020). Dieses Ticket gilt für den Bereich Nürnberg-Fürth-Stein (Zonen 100 und 200). '
                    'Es gilt nicht bis Schwabach, Erlangen, Bamberg oder Bayreuth. Details findet ihr bei den',
                style: TextStyle(fontSize: 15.0, )
              ),
              SizedBox(
                height: 20.0,
              ), 

              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlVAG,
                  child: new Text('Verkehrsbetrieben'),
                  color: Colors.green[600],
                ),
              ),

              SizedBox(
                height: 20.0,
              ), 

              Text("Wissenswertes",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ), 
              SizedBox(
                height: 20.0,
              ),            
              Text('Geschäfte in Bayern machen um 20:00 Uhr zu. WIRKLICH! Außer der Lidl im Bahnhof, der hat länger offen...',
                style: TextStyle(fontSize: 15.0, )
              ),
              SizedBox(
                height: 20.0,
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

_launchUrlJtHome() async {
  const url = 'https://www.mensa.de/mensa-vor-ort/nationale-veranstaltungen/jt/jt2020/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchUrlVAG() async {
  const url = 'https://www.vag.de';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}