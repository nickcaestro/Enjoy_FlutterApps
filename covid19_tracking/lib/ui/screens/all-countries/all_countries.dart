import 'package:covid19_tracking/ui/widgets/country_card.dart';
import 'package:flutter/material.dart';

class AllCountriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(15),
      itemCount: 10,
      itemBuilder: (context, index) {
        return CountryCard();
      },
    );
  }
}
