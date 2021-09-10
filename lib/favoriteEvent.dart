import 'package:flutter/material.dart';
import 'package:jt_app/globals.dart';
import 'databaseHelper.dart';

class FavoriteWidget extends StatefulWidget {

  final int eventID;

  FavoriteWidget({Key key, this.eventID}) : super(key: key);

  @override
  FavoriteWidgetState createState() => FavoriteWidgetState(key: key, eventID: eventID);
}

class FavoriteWidgetState extends State<FavoriteWidget> {

  int eventID;
  List<FavoritEventID> favoritEvents;

  FavoriteWidgetState({Key key, this.eventID}); 

  DatabaseHelper dbHelper = new DatabaseHelper();

  void _toggleFavorite() {
    setState(() {
      if (listOfFavorits.contains(eventID)) {
        listOfFavorits.remove(eventID);
        dbHelper.deleteFavorit(eventID);

      } else {
        listOfFavorits.add(eventID);
        dbHelper.insertFavorit(FavoritEventID(eventID: eventID) );
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (listOfFavorits.contains(eventID) ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }

}

class FavoritEventID {

  int eventID;

  //FavoritEventID(this.eventID);
  FavoritEventID({Key key, this.eventID});

  int get id => eventID;

  String favorit = 'Favorit';

  //Convert a FavoritEventID object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
      if (eventID != null) {
        map['eventID'] = eventID;
      }
      map['favorit'] = favorit; 
      // nötig für Map, ohne Map kein insert bei SQflite
    return map;
  }

  // Extract a FavoritEventID object from a Map object
  FavoritEventID.fromMapObject(Map<String, dynamic> map) {

    this.eventID = map['eventID'];
    this.favorit = map['favorit'];
	}

}