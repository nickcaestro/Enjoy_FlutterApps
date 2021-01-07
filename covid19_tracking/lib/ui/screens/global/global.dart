import 'package:flutter/material.dart';
import '../../widgets/status_card.dart';

class GlobalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: [
        StatusCard(
          icon: 'assets/images/icons/total.png',
          status: '35M',
          label: 'Total',
          color: Colors.pink,
        ),
        StatusCard(
          icon: 'assets/images/icons/new.png',
          status: '30K',
          label: 'New',
          color: Colors.blue,
        ),
        StatusCard(
          icon: 'assets/images/icons/active.png',
          status: '10M',
          label: 'Active',
          color: Colors.teal,
        ),
        StatusCard(
          icon: 'assets/images/icons/critical.png',
          status: '70K',
          label: 'Critical',
          color: Colors.orange,
        ),
        StatusCard(
          icon: 'assets/images/icons/recovered.png',
          status: '30M',
          label: 'Recovered',
          color: Colors.green,
        ),
        StatusCard(
          icon: 'assets/images/icons/death.png',
          status: '2M',
          label: 'Deaths',
          color: Colors.red,
        ),
      ],
    );
  }
}
