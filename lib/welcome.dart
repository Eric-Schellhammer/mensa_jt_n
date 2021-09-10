import 'package:flutter/material.dart';
import 'package:jt_app/emergency.dart';
import 'package:jt_app/eventPerDay.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sqflite/sqflite.dart';
import 'loadDate.dart';
import 'eventPerCategory.dart';
import 'eventPerDay.dart';
import 'listAllEvents.dart';
import 'infosApp.dart';
import 'event.dart';
import 'globals.dart';
import 'dart:async';
import 'databaseHelper.dart';
import 'favoriteEvent.dart';
import 'emergency.dart';
import 'infosJT.dart';
import 'myFirstJT.dart';
import 'accessNuernberg.dart';
import 'infoRahmenprog.dart';
import 'infoGuides.dart';

class WelcomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage> {


  List<Event> events;
  DatabaseHelper dbHelper = new DatabaseHelper();
  List<FavoritEventID> favoritEvents;

  @override
  Widget build(BuildContext context){

    if (allEvents != null) {
      if (allEvents.length == 0){
        updateEvents();
      }
    }

    if (listOfFavorits.isEmpty) {
      updateFavoritList();
      if (favoritEvents != null){
        for (var i = 0; i < favoritEvents.length ; i++) {
          listOfFavorits.add(favoritEvents[i].eventID);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("JT 2020 Nürnberg"),
      ), 
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(
              child: Image.asset(
                'assets/images/logo_jt_nuernberg_gross.png',
                width: 100.0,
                height: 100.0,
              ),
            ),
            ListTile(
              title: Text("Events nach Tagen",
                style: TextStyle(
                          fontSize: 18.0,
                        ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventPerDay()), 
                );
              },
            ),
            ListTile(
              title: Text("Events nach Kategorie",
                style: TextStyle(
                          fontSize: 18.0,
                        ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventPerCategory()), 
                );
              },
            ),
            ListTile(
              title: Text("Meine Favoriten",
                style: TextStyle(
                          fontSize: 18.0,
                        ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewEvents(specDay: "all", specCategory: "favorit",)),
                );
              },
            ),
            ListTile(
              title: Text("Selbermachevents",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: _launchUrlSelbermachevents, 
            ),
            ListTile(
              title: Text("Meine Buchungen",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: _launchUrlMensaBuchungJT, 
            ),
            ListTile(
              title: Text("Daten aktualisieren",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoadData(day: "none", category: "Daten wurden geladen",)),
                );
              },
            ),
            ListTile(
              title: Text("Allgemeines zum JT",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfosJT()),
                );
              },
            ),
            ListTile(
              title: Text("Infos zum Rahmenprogramm",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfosRahmenprogramm()),
                );
              },
            ),
            ListTile(
              title: Text("Infos für Guides",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfosGuide()),
                );
              },
            ),
            ListTile(
              title: Text("Mein erstes JT",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyFirstJT()),
                );
              },
            ),
            
            ListTile(
              title: Text("Barrierefreiheit in Nürnberg",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccessNuernberg()),
                );
              },
            ), 
            ListTile(
              title: Text("Infos zur App",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfosApp()),
                );
              },
            ),           
            ListTile(
              title: Text("Notfall / Emergency",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
              onTap: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Emergency()),
                );
              },
            ),           
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo_jt_nuernberg_gross.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 72.0,
              ),
              new Center (
                child: Text("Willkommen in Franken", 
                  style: TextStyle(fontSize: 26.0)
                ),
              ),
              SizedBox(
                height: 85.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/mblem_klein_rgb.png',
                    width: 35.0,
                    height: 35.0,
                  ),
                  Image.asset(
                    'assets/images/mind_schriftzug.png',
                    width: 120.0,
                    //height: 250.0,
                  ),
                ],
              ),
            ],
          ),
        )
      ,)
    );
  }

    void updateEvents(){
      final Future<Database> dbFuture = dbHelper.database; 
      dbFuture.then((database) {
        Future<List<Event>> eventsFuture = dbHelper.getEventList();
          eventsFuture.then((events) {
            setState(() {
              this.events = events;
              allEvents = events;
            });
          });  
      }); 
    }  

    void updateFavoritList(){
    final Future<Database> dbFuture = dbHelper.database; 
    dbFuture.then((database) {
      Future<List<FavoritEventID>> favoritFuture = dbHelper.getFavoritList();
        favoritFuture.then((favoritEvents) {
          setState(() {
            this.favoritEvents = favoritEvents;
          });
        });  
    }); 
  }
  
} 

_launchUrlMensaBuchungJT() async {
  const url = 'https://db.mensa.de/edetail?mpn=Events&eid=1732713500002';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchUrlSelbermachevents() async {
  const url = 'https://www.mensa.de/mensa-vor-ort/nationale-veranstaltungen/jt/jt2020/programm/selbstmach-events/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}