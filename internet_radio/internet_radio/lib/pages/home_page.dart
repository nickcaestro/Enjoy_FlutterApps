import 'package:flutter/material.dart';
import 'package:internet_radio/utils/hex_color.dart';

class HomepPage extends StatefulWidget {
  @override
  _HomepPageState createState() => _HomepPageState();
}

class _HomepPageState extends State<HomepPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [new Text("Page 1"), new Text("Page 2")];

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: HexColor("#182545"),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: HexColor("#ffffff"),
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavItem(Icons.play_arrow, "Listen"),
            _bottomNavItem(Icons.favorite, "Favorite")
          ],
          onTap: onTabTapped,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}

_bottomNavItem(IconData icon, String title) {
  return BottomNavigationBarItem(
    icon: new Icon(
      icon,
      color: HexColor("#6d7381"),
    ),
  );
}
