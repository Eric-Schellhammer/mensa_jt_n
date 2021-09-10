// https://medium.com/@abeythilakeudara3/to-do-list-in-flutter-with-sqlite-as-local-database-8b26ba2b060e
// https://flutter.dev/docs/cookbook/persistence/sqlite#5-insert-a-dog-into-the-database

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'event.dart';
import 'favoriteEvent.dart';
import 'package:path/path.dart' as p;

class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String jtTable = 'jt_table';
  String favoritTable = 'favorit_table';

  String colEventID = 'eventID';
  String colFavorit = 'favorit';

	String colTid = 'tId';
  String colId = 'id';
	String colName = 'name';
	String colKategorie = 'kategorie';
	String colDauer = 'dauer';
  String colStart = 'start';

  String colLocation = 'location';
	String colStrasse = 'strasse';
	String colPlz = 'plz';
	String colOrtsname = 'ortsname';
  String colGebaeude = 'gebaeude';

  String colRaum = 'raum';
	String colKoordLat = 'koordLat';
	String colKoordLon = 'koordLon';
	String colAbmarsch = 'abmarsch';
  String colAbgesagt = 'abgesagt';

  String colEventtext = 'eventtext';
	String colBild = 'bild';
	String colBildtitel = 'bildtitel';
	String colBarrierefreiheit = 'barrierefreiheit';
  String colHaltestelle = 'haltestelle';



  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

  Future<Database> initializeDatabase() async {
    //Get path of the directory for android and iOS.
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'jt4.db');

		// Open/create the database at a given path
		var jtDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return jtDatabase;
	}

  void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $jtTable($colTid INTEGER PRIMARY KEY, $colId TEXT, '
				'$colName TEXT, $colKategorie TEXT, $colDauer TEXT, $colStart TEXT, '
        '$colLocation TEXT, $colStrasse TEXT, $colPlz TEXT, $colOrtsname TEXT, $colGebaeude TEXT, '
        '$colRaum TEXT, $colKoordLat TEXT, $colKoordLon TEXT, $colAbmarsch TEXT, $colAbgesagt TEXT, '
        '$colEventtext TEXT, $colBild TEXT, $colBildtitel TEXT, $colBarrierefreiheit TEXT, $colHaltestelle TEXT)');
    await db.execute('CREATE TABLE $favoritTable($colEventID INTEGER PRIMARY KEY, $colFavorit TEXT)');    
	}

  // Fetch Operation: Get all Event objects from database
	Future<List<Map<String, dynamic>>> getEventMapList() async {
		Database db = await this.database;

		//var result = await db.rawQuery('SELECT * FROM $jtTable order by $colName ASC');
		var result = await db.query(jtTable); //, orderBy: '$colName ASC');
		return result;
	}
  // Fetch Operation: Get all Favorit objects from database
	Future<List<Map<String, dynamic>>> getFavoritMapList() async {
		Database db = await this.database;
		var result = await db.query(favoritTable); //, orderBy: '$colName ASC');
		return result;
	}

  // Insert Operation: Insert an event object to database
	Future<int> insertEvent(Event event) async {
		Database db = await this.database;
		var result = await db.insert(jtTable, event.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
		return result;
	}
  // Insert Operation: Insert a FavoritEventID object to database
  Future<int> insertFavorit(FavoritEventID favEventID) async {
		Database db = await this.database;
		var result = await db.insert(favoritTable, favEventID.toMap()  , conflictAlgorithm: ConflictAlgorithm.replace,);
		return result;
	}

  // Update Operation: Update an event object and save it to database
	Future<int> updateEvent(Event event) async {
		var db = await this.database;
		var result = await db.update(jtTable, event.toMap(), where: '$colId = ?', whereArgs: [event.id]);
		return result;
	}

  // Delete Operation: Delete an event object from database
	Future<int> deleteEvent(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $jtTable WHERE $colId = $id');
		return result;
	}
  // Delete Operation: Delete a FavoritEventID object from database
	Future<int> deleteFavorit(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $favoritTable WHERE $colEventID = $id');
		return result;
	}

  // Get number of event objects in database
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $jtTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

  // Get the 'Map List' [ List<Map> ] and convert it to 'event List' [ List<Event> ]
	Future<List<Event>> getEventList() async {

		var eventMapList = await getEventMapList(); // Get 'Map List' from database

    int count = 0;
    if (eventMapList.length !=null) {
      count = eventMapList.length;
    }

		List<Event> eventList = List<Event>();
		// For loop to create a 'event List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			eventList.add(Event.fromMapObject(eventMapList[i]));
		}

		return eventList;
	}

  // Get the 'Map List' [ List<Map> ] and convert it to 'FavoritEventID List' [ List<FavoritEventID> ]
	Future<List<FavoritEventID>> getFavoritList() async {

		var favoritMapList = await getFavoritMapList(); // Get 'Map List' from database
		//int count = eventMapList.length !=null ? eventMapList.length : 0;         // Count the number of map entries in db table

    int count = 0;
    if (favoritMapList.length !=null) {
      count = favoritMapList.length;
    }

		List<FavoritEventID> favoritList = List<FavoritEventID>();
		// For loop to create a 'favorit List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			favoritList.add(FavoritEventID.fromMapObject(favoritMapList[i]));
		}

		return favoritList;
	}


}