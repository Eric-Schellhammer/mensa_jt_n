import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFirstJT extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dein erstes JT"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //damit linksbündig
              children: <Widget>[
              Text("Wir freuen uns, dass dein erstes Jahrestreffen bei uns in Nürnberg stattfindet. :-)\nMit diesen Tipps möchten wir dazu beitragen, "
                'dass du ein schönes, interessantes und unvergessliches erstes JT erlebst.',
                style: TextStyle(fontSize: 15.0, )
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text("Ankommen und Check-In ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('Erster Anlaufpunkt ist das Tagungshotel: NH Collection Nürnberg City  Bahnhofstr. 17-19, 90402 Nürnberg. Im Tagungshotel geht '
                'es rechterhand in den Tagungsbereich. Am Check-In bekommst Du Deine Teilnehmer-Unterlagen (Tagungsausweis, '
                'Eintrittskarten, Stadtplan, …). Ggf. vorbestellte T-Shirts und andere Merchandizing-Artikel bekommst du in der BoutIQe vor Ort.\n\n'
                'Nun kannst Du eintauchen ins JT-Getümmel und fünf Tage Spaß haben, Neues erfahren und nette Leute treffen. Erkennbar an '
                'den roten Bändeln werden sich Hunderte Ms und ihre Freunde in der ganzen Stadt verteilen. Setzt Euch einfach mit dazu in einem '
                'netten Café oder führt gleich in der Lobby vor den Vortragsräumen die ersten Gespräche – hier wird fünf Tage lang der Dreh- und Angelpunkt sein.',
                style: TextStyle(fontSize: 15.0, )
              ),
              SizedBox(
                height: 20.0,
              ),              
              Text("Wie komme ich zu den Events",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('Einzelgänger finden anhand der Anfahrtsinformationen (siehe Details zu den Events) sicher zu jedem Eventort. Bitte plant genügend Zeit ein und kommt pünktlich dort an.\n\n'
                'Für Rudel-Liebhaber startet zu jedem Außenevent eine Gruppe angeführt von einem Guide, dem ihr Euch anschließen könnt. Bitte '
                'findet Euch dazu aber überpünktlich (!) im Tagungshotel ein. Die Abmarschzeiten werden exakt eingehalten und sind '
                'in den Details zu den Events und im Tagungsheft zu finden.\n\n'
                'Enthalten im Orgabeitrag habt Ihr bei Euren Unterlagen ein Ticket für den Nürnberger ÖPNV (VGN genannt) bekommen. Dieses '
                'deckt die meisten Veranstaltungswege ab. Events, für die ihr zusätzliche Fahrkarten braucht, sind entsprechend gekennzeichnet.',
                style: TextStyle(fontSize: 15.0, )

              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Informationen…",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('…bekommt ihr während der Öffnungszeiten direkt vom Orga-Team am Infopoint und im Tagungsbüro. Alle Eventdaten findet ihr in den Event-Details '
                'und in Kurzform stehen sie auch im Tagungsheft. Diese Webseiten werden laufend (vulgo: wenn es Neues gibt) aktualisiert.',
                style: TextStyle(fontSize: 15.0, )
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Ultimative Tipps",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('Die Lobby des Tagungshotels ist zu allen möglichen Zeiten ein guter Anlaufpunkt, um Gesprächspartner zu finden.\n'
                'Und an den unmöglichen Zeiten? Schau zuallererst in der Bar des Tagungshotels nach. '
                'Noch später geht es wieder in die Lobby, hier kann es leicht passieren, dass Du noch um 4:00 Uhr morgens jemanden triffst.\n\n'
                'Traut Euch – schließt Euch an – fragt dem Orga-Team und allen Teilnehmern Löcher in den Bauch und das JT wird Euch unvergessen bleiben!',
                style: TextStyle(fontSize: 15.0, )
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Alle weiteren Infos...",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('... rund um euer erstes JT findet ihr auf der JT Homepage unter:\n',
                style: TextStyle(fontSize: 15.0, )
              ),
              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlErstesJT,
                  child: new Text('JT-Neulinge'),
                  color: Colors.deepOrange,
                ),
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

_launchUrlErstesJT() async {
  const url = 'https://www.mensa.de/mensa-vor-ort/nationale-veranstaltungen/jt/jt2020/spezielles/jtneulinge/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}