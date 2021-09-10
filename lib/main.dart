import 'package:flutter/material.dart';
import 'welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'JT 2020';

    return MaterialApp(
      title: appTitle,
      home: WelcomePage(), 
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Beispiel von:
//
// https://grokonez.com/flutter/flutter-http-client-example-listview-fetch-data-parse-json-background
//
// Laufen auf iPhone: Info
//
// https://medium.com/front-end-weekly/how-to-test-your-flutter-ios-app-on-your-ios-device-75924bfd75a8
