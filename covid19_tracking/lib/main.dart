import 'package:flutter/material.dart';
import 'package:covid19_tracking/ui/screens/home/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0XFF0E0A25),
        accentColor: Colors.white,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0XFF0E0A25),
        fontFamily: 'ABeeZee',
        cardColor: Color(0XFF14193A),
      ),
      home: HomeScreen(),
    );
  }
}
