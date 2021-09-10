class Event {
  
  int tId;
  String id;
  String name;
  String kategorie;
  String dauer;
  String start;
  //final DateTime startDT;
  //
  String location;
  String strasse;
  String plz;
  String ortsname;
  String gebaeude;
  //
  String raum;
  String koordLat;
  String koordLon;
  String abmarsch;
  String abgesagt;
  //
  String eventtext;
  String bild;
  String bildtitel;
  String barrierefreiheit;
  String haltestelle;
  

  Event({ this.tId, this.id, this.name, this.kategorie, this.dauer, 
          this.start, 
          //this.startDT,
          this.location, this.strasse, this.plz, this.ortsname, this.gebaeude,
          this.raum, this.koordLat, this.koordLon, this.abmarsch, this.abgesagt,
          this.eventtext, this.bild, this.bildtitel, this.barrierefreiheit, this.haltestelle
          });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      tId: int.tryParse(json['t_ID'] != null ? json['t_ID'] : '99999'),
      id: json['ID'] as String, 
      name: json['name'] as String,
      kategorie: json['kategorie'] as String,
      dauer: json['dauer'] as String,
      start: json['start'] as String,
      //startDT: DateTime.tryParse(json['start'] != null ? json['start'] : '1999-09-09 09:00:00'),
      //
      location: json['location'] as String,  
      strasse: json['strasse'] as String,
      plz: json['plz'] as String,
      ortsname: json['ortsname'] as String,
      gebaeude: json['gebaeude'] as String, 
      //
      
      //raum: json['raum'] != '' ? json['raum'] : '*' as String,  
      raum: json['raum'] as String,
      koordLat: json['lat'] as String,
      koordLon: json['lon'] as String,
      abmarsch: json['abmarsch'] as String,
      abgesagt: json['abgesagt'] as String, 
      //
      eventtext: json['eventtext'] as String,  
      bild: json['bild'] as String,
      bildtitel: json['bildtitel'] as String,
      barrierefreiheit: json['barrierefreiheit'] as String,
      haltestelle: json['haltestelle'] as String,
    );
  }

  // Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (tId != null) {
			map['tId'] = tId;
		}
    map['id'] = id;
		map['name'] = name;
		map['kategorie'] = kategorie;
		map['dauer'] = dauer;
		map['start'] = start;

    map['location'] = location;
		map['strasse'] = strasse;
		map['plz'] = plz;
		map['ortsname'] = ortsname;
		map['gebaeude'] = gebaeude;

    map['raum'] = raum;
		map['koordLat'] = koordLat;
		map['koordLon'] = koordLon;
		map['abmarsch'] = abmarsch;
		map['abgesagt'] = abgesagt;

    map['eventtext'] = eventtext;
		map['bild'] = bild;
		map['bildtitel'] = bildtitel;
		map['barrierefreiheit'] = barrierefreiheit;
		map['haltestelle'] = haltestelle;

		return map;
	}

  // Extract a Note object from a Map object
	Event.fromMapObject(Map<String, dynamic> map) {

    this.tId = map['tId'];
		this.id = map['id'];
		this.name = map['name'];
		this.kategorie = map['kategorie'];
		this.dauer = map['dauer'];
    this.start = map['start'];

    this.location = map['location'];
		this.strasse = map['strasse'];
		this.plz = map['plz'];
		this.ortsname = map['ortsname'];
		this.gebaeude = map['gebaeude'];

    this.raum = map['raum'];
		this.koordLat = map['koordLat'];
		this.koordLon = map['koordLon'];
		this.abmarsch = map['abmarsch'];
		this.abgesagt = map['abgesagt'];

    this.eventtext = map['eventtext'];
		this.bild = map['bild'];
		this.bildtitel = map['bildtitel'];
		this.barrierefreiheit = map['barrierefreiheit'];
		this.haltestelle = map['haltestelle'];
	}


}


