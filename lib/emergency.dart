import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Emergency extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notfall / Emergency"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //damit linksbündig
              children: <Widget>[           
              Text("Notrufnummer / Emergency:",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, )
              ),              
              SizedBox(
                height: 30.0,
              ),
              new Center(
                child: Text("112",
                  style: TextStyle(fontSize: 65.0, fontWeight: FontWeight.bold)
                ), 
              ),             
              SizedBox(
                height: 45.0,
              ),              
              Text("Ärztlicher Notdienst /\nDoctors Office",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text('Du brauchst einen Arzt, es handelt sich aber nicht um einen Notfall. Zu Hause würdest du zum Hausarzt gehen.\n\n'
                  'You need a doctor, it is not an emergency though. At home you would visit your family doctor.\n',
                style: TextStyle(fontSize: 15.0, )
              ),
              Text('Ärztliche Bereitschaftspraxis Nürnberg\n'
                'Bahnhofstraße 11A\n90402 Nürnberg\n\nTelefonnummer / Phone number:\n',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
              ),
              new Center(
                child: Text("0911 - 116 117",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Öffnungszeiten findet ihr unter: /\nFor opening hours, see:\n',
                style: TextStyle(fontSize: 15.0)
              ),
              new Center(
                child: new RaisedButton(
                  onPressed: _launchUrlNotfallpraxis,
                  child: new Text('Notfallpraxis'),
                  color: Colors.red[700],
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

_launchUrlNotfallpraxis() async {
  const url = 'https://www.kvb.de/index.php?id=712';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}