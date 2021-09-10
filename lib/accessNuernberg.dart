import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessNuernberg extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barrierefreiheit Nürnberg"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //damit linksbündig
              children: <Widget>[        
              Text("Rollstuhltoiletten",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text("An einigen U-Bahnhöfen gibt es Rollstuhltoiletten. Hierfür gibt es vom VAG eine Liste, "
                "die ihr hier finden könnt:\n",
                style: TextStyle(fontSize: 15.0, )
              ),
              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlInfoRT,
                  child: new Text('Rollstuhltoiletten U-Bahnhöfe'),
                  color: Colors.yellow[700],
                ),
              ),
              SizedBox(
                height: 20.0,
              ), 
              Text("Die weiteren Rollstuhltoiletten in Nürnberg sind im Stadtplan eingezeichnet. Stadtpläne könnt ihr bei uns im Tagbunsbüro bekommen.\n",
                style: TextStyle(fontSize: 15.0, )
              ), 
              SizedBox(
                height: 20.0,
              ),             
              Text("U-Bahn",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('Alle U-Bahnhöfe in Nürnberg und Fürth haben mindestens einen Aufzug. Die Breite der Türen sowie die '
                'Kabinengröße variieren etwas und sind in der dieser Aufstellung vom VAG aufgelistet:\n',
                style: TextStyle(fontSize: 15.0, )
              ),
              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlUbahnAufzug,
                  child: new Text('Aufzuggröße'),
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Aktuelle Störungen von Aufzügen werden hier angegeben:\n',
                style: TextStyle(fontSize: 15.0, )
              ),
              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlAufzStoerung,
                  child: new Text('Aufzug - Störungen'),
                  color: Colors.red[700],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Straßenbeschaffenheit",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('Wir haben die Straßen in der Innenstadt Nürnberg in 3 Kategorien eingeteilt und diese im Plan gekennzeichnet, v.a. für '
                'Rollstuhlfahrer und Gehbehinderte. Es handelt sich hier um eine grobe Einschätzung und keine Garantie zurecht zu kommen.\n',
                style: TextStyle(fontSize: 15.0, )
              ),
              Image.asset(
                'assets/images/n-innenstadt-strassen.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Weiß gelassene Straßen:',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
              ),
              Text('Hier sollte man gut zurecht kommen können, d.h. die Straßen und / oder Gehwege sind geteert oder mit flachen Bodenplatten ausgelegt.\n',
                style: TextStyle(fontSize: 15.0, )
              ),
              Text('Orange:', 
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
              Text('Straßen mit Kopfsteinpflaster, weitgehend ohne Alternative z.B. gut befahrbarer Gehweg etc.\n'),
              Text('Rosa:', 
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.pink)),
              Text('Schwierige Straßen, d.h. mit Kopfsteinpflaster und / oder Steigungen\n\n',
                style: TextStyle(fontSize: 15.0, )),
              Text('Ein großer Teil der Nürnberger Innenstadt ist außerdem in Google Streetview erfasst. Hier kann man sich auch noch ein genaueres '
                'Bild von der Bodenbeschaffenheit machen.\n\nWeitere Informationen zur Rollstuhlfreundlichkeit einzelner Restaurants, Geschäfte etc. in Nürnberg findet Ihr auch bei',
                style: TextStyle(fontSize: 15.0, )
              ),
              SizedBox(
                height: 20.0,
              ),
              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlWheelmap,
                  child: new Text('Wheelmap'),
                  color: Colors.green[600],
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

_launchUrlInfoRT() async {
  const url = 'https://www.vag.de/fileadmin/user_upload/06_dokumente/Services/toiletten-nuernberg-vag.pdf';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchUrlUbahnAufzug() async {
  const url = 'https://www.vag.de/fileadmin/user_upload/06_dokumente/Services/aufzugliste_masse.pdf';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchUrlAufzStoerung() async {
  const url = 'https://www.vag.de/fahrplan/fahrplanaenderungen-stoerungen/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchUrlWheelmap() async {
  const url = 'https://wheelmap.org/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}