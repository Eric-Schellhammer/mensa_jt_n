import 'package:flutter/material.dart';
import 'event.dart';


class AccsessilbeWidget extends StatefulWidget {

  final Event event;

  AccsessilbeWidget({Key key, this.event}) : super(key: key);

  @override
  _AccsessilbeWidgetState createState() => _AccsessilbeWidgetState(key: key, event: event);
}

class _AccsessilbeWidgetState extends State<AccsessilbeWidget> {

  final Event event;

  bool _isAccessible = false;
  bool _isPartlyAccessible = false;

  _AccsessilbeWidgetState({Key key, this.event}); 
  

  //Icon für nicht rollitauglich: IconData(57395, fontFamily: 'MaterialIcons')
  // evtl für eingeschränkt tauglich: IconData(59603, fontFamily: 'MaterialIcons')
  // also mit Hilfe
  // Rolli geeignet: IconData(59700, fontFamily: 'MaterialIcons')
  // Rolli eingeschr: IconData(59668, fontFamily: 'MaterialIcons')

  @override
  Widget build(BuildContext context) {

    if (event.barrierefreiheit == "Rollstuhltauglich") {
      _isAccessible = true;
    }
    else if (event.barrierefreiheit == "Eingeschränkt rollstuhltauglich (siehe Anmerkungen)") {
      _isPartlyAccessible = true;
    }

    return IconButton(
      icon: (_isAccessible ? Icon(IconData(59700, fontFamily: 'MaterialIcons')) :
              (_isPartlyAccessible ? Icon(IconData(59668, fontFamily: 'MaterialIcons')) 
              : Icon(IconData(57395, fontFamily: 'MaterialIcons'))
            )),
      iconSize: 22.0,  
      onPressed: null, 
    );
       
  }

}