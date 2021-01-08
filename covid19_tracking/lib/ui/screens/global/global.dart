import 'package:flutter/material.dart';
import '../../widgets/status_card.dart';
import 'package:provider/provider.dart';
import '../../../data/providers/reports.dart';

class GlobalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Reports>(
      builder: (context, model, child) {
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
              status: model.globalCases.totalCases,
              label: 'Total',
              color: Colors.pink,
            ),
            StatusCard(
              icon: 'assets/images/icons/new.png',
              status: model.globalCases.newCases,
              label: 'New',
              color: Colors.blue,
            ),
            StatusCard(
              icon: 'assets/images/icons/active.png',
              status: model.globalCases.activeCases,
              label: 'Active',
              color: Colors.teal,
            ),
            StatusCard(
              icon: 'assets/images/icons/critical.png',
              status: model.globalCases.criticalCases,
              label: 'Critical',
              color: Colors.orange,
            ),
            StatusCard(
              icon: 'assets/images/icons/recovered.png',
              status: model.globalCases.recoveredCases,
              label: 'Recovered',
              color: Colors.green,
            ),
            StatusCard(
              icon: 'assets/images/icons/death.png',
              status: model.globalCases.totalDeaths,
              label: 'Deaths',
              color: Colors.red,
            ),
          ],
        );
      },
    );
  }
}
