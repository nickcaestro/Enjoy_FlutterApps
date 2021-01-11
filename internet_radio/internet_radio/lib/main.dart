import 'package:flutter/material.dart';
import 'package:internet_radio/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Monteserrat'),
      home: SafeArea(
        bottom: false,
        child: Scaffold(
          primary: false,
          body: HomePage(),
        ),
      ),
    );
  }
}
