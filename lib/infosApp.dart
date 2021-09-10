import 'package:flutter/material.dart';

class InfosApp extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos zur App"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //damit linksbündig
              children: <Widget>[            
              Text("Daten aktualisieren ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text("Die Daten werden nicht automatisch aktualisiert. D.h. ab und zu könnt ihr selber die Events aktualisieren um z.B. zu erfahren ob ein Event abgesagt werden musste.\n",
                style: TextStyle(fontSize: 15.0, )

              ),
              SizedBox(
                height: 20.0,
              ),              
              Text("Legende Barrierefreiheit",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
              ),              
              SizedBox(
                height: 20.0,
              ),
              Text("Wir haben uns beim jeweiligen Veranstalter nach der Barrierefreiheit erkundigt, v.a. nach der Möglichkeit mit dem Rollstuhl "
                "daran teilzunehmen. In den Events verwenden wir folgende Kategorien und Symbole für die Rollstuhltauglichkeit: \n",
                style: TextStyle(fontSize: 15.0, )

              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(IconData(59700, fontFamily: 'MaterialIcons')),
                  iconSize: 27.0,  
                  onPressed: null,
                ),
                title: Text("Rollstuhltauglich",
                  style: TextStyle(fontSize: 15.0)
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(IconData(59668, fontFamily: 'MaterialIcons')),
                  iconSize: 27.0,  
                  onPressed: null,
                ),
                title: Text("Eingeschränkt Rollstuhltauglich\nBitte beachtet die Hinweise zu den jeweiligen Events. Diese sind in den Details in der App oder im Tagunsheft",
                  style: TextStyle(fontSize: 15.0)
                ),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(IconData(57395, fontFamily: 'MaterialIcons')),
                  iconSize: 26.0,  
                  onPressed: null,
                ),
                title: Text("Nicht Rollstuhltauglich",
                  style: TextStyle(fontSize: 15.0)
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