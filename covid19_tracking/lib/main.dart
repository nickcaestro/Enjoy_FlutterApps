import 'package:flutter/material.dart';
import 'package:covid19_tracking/ui/screens/home/home.dart';
import 'package:covid19_tracking/ui/constants/constants.dart';
import 'package:provider/provider.dart';
import 'data/providers/reports.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider(
      create: (context) => Reports(),
      builder: (context, child) {
        return MaterialApp(
          theme: kTheme,
          home: HomeScreen(),
        );
      },
    );
  }
}
