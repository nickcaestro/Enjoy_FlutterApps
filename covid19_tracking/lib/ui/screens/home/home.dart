import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../global/global.dart';
import '../all-countries/all_countries.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('COVID19 TRACKING'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: FaIcon(FontAwesomeIcons.globe),
                text: 'GLOBAL',
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.list),
                text: 'ALL COUNTRIES',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GlobalScreen(),
            AllCountriesScreen(),
          ],
        ),
      ),
    );
  }
}
