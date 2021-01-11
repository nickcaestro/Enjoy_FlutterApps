import 'package:flutter/material.dart';

class HomepPage extends StatefulWidget {
  @override
  _HomepPageState createState() => _HomepPageState();
}

class _HomepPageState extends State<HomepPage> {
  int _currentIndex = 0;
  final List<Widget> _childer = [new Text("Page 1"), new Text("Page 2")];

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: HexColor("#182545"),
      ),
    ));
  }
}
