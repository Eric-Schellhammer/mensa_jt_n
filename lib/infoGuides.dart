import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfosGuide extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos für Guides"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //damit linksbündig
              children: <Widget>[
              Text("Guides für einzelne Veranstaltungen",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('Guides sind die netten Menschen, die Euch am Tagungshotel erwarten und dann zu dem jeweiligen Event mitnehmen:\n\n'
                '- Für jedes Event außerhalb des Tagungshotels sammelt ein Guide die Gruppe am Tagungshotel ein, hakt die Erschienenen auf der Teilnehmerliste ab und geht pünktlich (!) mit der Gruppe los, sei es zum ÖPNV oder direkt zum Event.\n\n'
                '- Für die Uhrzeiten und Wege erhält er dazu detaillierte Beschreibungen vom Orgateam.\n\n'
                '- Bei manchen Events sind Eintrittsgelder, Tickets oder anderes Zubehör mitzunehmen. Dafür trägt er die Verantwortung.\n\n'
                '- Am Eventort ergänzt der Guide auf der Teilnehmerliste diejenigen Teilnehmer, die direkt hingekommen sind, und übergibt die Gruppe an den Veranstalter.\n\n'
                '- Damit endet vorerst seine Tätigkeit. Das Event selber kann er genießen wie jeder andere Teilnehmer, schließlich hat er, wie alle anderen, dafür bezahlt.\n\n'
                '- Er ist explizit nicht verantwortlich für das Verhalten einzelner Teilnehmer auf dem Event, nicht für das Einsammeln von Trinkgeldern und auch nicht für den Rückweg zum Tagungshotel.\n\n'
                '- Seine ehrenamtliche Tätigkeit endet mit der Rückgabe der Teilnehmerliste an das Orgateam im Tagungshotel (wobei das nicht sofort passieren muss, wenn der Guide im Anschluß erst ein anderes Event besuchen möchte).\n\n'
                '- Ggf. gibt es Rückgelder aus nicht genutzten Eintrittsgeldern oder Rückgaben von Tickets. Diese sollten bitte möglichst kurzfristig im Tagungsbüro abgegeben werden.\n\n'
                'Unter folgendem Link gibt es die allgemeinen Informationen für die Guides. Falls du den Link nicht öffnen kannst, gibt es diese Infos '
                'natürlich auch im Tagungsbüro.\n',
                style: TextStyle(fontSize: 15.0, )
              ), 
              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlInfoGuides,
                  child: new Text('Infos für Guides'),
                  color: Colors.yellow[700],
                ),
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text("Vielen Dank, dass du dich als Guide bereit erklärt hast, die Gruppe zum Event zu führen!",
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

_launchUrlInfoGuides() async {
  const url = 'https://www.mensa.de/wp-content/uploads/2020/01/Allgemeine-Infos-f%C3%BCr-Guides.pdf';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
