import 'package:flutter/material.dart';
import 'event.dart';
import 'detailEvents.dart';
import 'detailVortragWorkshop.dart';
import 'favoriteEvent.dart';
import 'accessibility.dart';
import 'globals.dart';
import 'package:intl/intl.dart';

class ListViewEvents extends StatelessWidget {

  final String specDay;
  final String specCategory;

  ListViewEvents({Key key, this.specDay, this.specCategory});

  @override
  Widget build(BuildContext context) {

    List<Event> events;

    Event specEvent = new Event();
    String appBarTitel; 

    // events aus globaler Liste. Wenn diese leer ist -> DB-Abfrage
    events = allEvents;

    filteredEvents.removeWhere((item) => item != null);

    if(events != null){
      if (specCategory != "all" && specCategory != "favorit") {
        for (var index = 0; index < events.length; index++) {
          specEvent = events[index];
          if (specEvent.kategorie == specCategory) {
            filteredEvents.add(specEvent);
          }
        }
        appBarTitel = specCategory;
      }
      else if (specCategory == "favorit") {
        for (var index = 0; index < events.length; index++) {
          specEvent = events[index];
          if (listOfFavorits.contains(specEvent.tId)) {
            filteredEvents.add(specEvent);
          }
        }
        appBarTitel = "Meine Favoriten";
      }
          
      else if (specDay != "all") {    
        for (var index = 0; index < events.length; index++) {
          specEvent = events[index];
          if (specEvent.start != null){
            if (specDay == 'Mittwoch' && 
                DateTime.tryParse(specEvent.start).day == 15){            
              filteredEvents.add(specEvent);
            }
            if (specDay == 'Donnerstag' && 
              DateTime.tryParse(specEvent.start).day == 16){
              filteredEvents.add(specEvent);
            }
            if (specDay == 'Freitag' && 
              DateTime.tryParse(specEvent.start).day == 17){
              filteredEvents.add(specEvent);
            }
            if (specDay == 'Samstag' && 
              DateTime.tryParse(specEvent.start).day == 18){
              filteredEvents.add(specEvent);
            }
            if (specDay == 'Sonntag' && 
              DateTime.tryParse(specEvent.start).day == 19){
              filteredEvents.add(specEvent);
            }
          appBarTitel = specDay;
          }
        }
      }
    }

    filteredEvents.sort((a, b) {
      if(a.start == null) return -1;
      if(b.start == null) return 1;
      return a.start.compareTo(b.start);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitel!=null?appBarTitel:"Keine Daten geladen"),
      ),
      body:Container(
        
        child: 
          ListView.builder(
          itemCount: filteredEvents.length != null ? filteredEvents.length : 0,
          padding: const EdgeInsets.all(12.5),         
          itemBuilder: (context, position) {
            return 
            Column(
              children: <Widget>[
                
                Divider(height: 5.0),
                ListTile(
                  leading: FavoriteWidget(eventID: filteredEvents[position].tId),
                  trailing: AccsessilbeWidget(event: filteredEvents[position]),
                  title: filteredEvents[position].abgesagt == '0' ?                     
                    Text('${filteredEvents[position].name}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: DateTime.tryParse(filteredEvents[position].start).day == 15
                          ? Colors.deepOrange 
                          : (DateTime.tryParse(filteredEvents[position].start).day == 16 
                            ? Colors.yellow[700]
                            : (DateTime.tryParse(filteredEvents[position].start).day == 17
                              ? Colors.lightGreen
                              : (DateTime.tryParse(filteredEvents[position].start).day == 18
                                ? Colors.green[600]
                                : Colors.red[700])))
                      ),
                    )                    
                    :Text('Abgesagt: ${filteredEvents[position].name}', 
                      style: TextStyle(fontSize: 18.0,)),
                  subtitle: Text(
                    '${DateFormat("dd.MM.   HH:mm").format(DateTime.tryParse(filteredEvents[position].start))}' ' - '
                    '${DateFormat("HH:mm").format(DateTime.tryParse(filteredEvents[position].start).add(new Duration(minutes: int.tryParse(filteredEvents[position].dauer))))}''\n' 
                    '${filteredEvents[position].location}'
                      ,
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  onTap: () { 
                    if (filteredEvents[position].kategorie == "Vortrag im Tagungshotel" || filteredEvents[position].kategorie == "Workshop im Tagungshotel") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailVortragWorkshop(event: filteredEvents[position]),
                      ));
                    }
                    else if (2==2) { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailEvents(event: filteredEvents[position]),
                      ));
                    }
                    
                  },
                ),
              ],
            );
          }),
      )
    );
  }

}
