import 'package:flutter/material.dart';
import 'package:covid19_tracking/ui/widgets/details.dart';
import 'package:covid19_tracking/ui/constants/constants.dart';

class CountryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () => buildBottomSheet(context),
        shape: kCardShape,
        leading: Image.asset(''),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'USA',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:2M',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            Text(
              'Active:1M',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Theme.of(context).cardColor,
      shape: kBottomSheetShape,
      context: context,
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'USA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Details(
              label: 'Total',
              status: '2M',
              color: Colors.pink,
            ),
            Details(
              label: 'New',
              status: '20K',
              color: Colors.blue,
            ),
            Details(
              label: 'Active',
              status: '1M',
              color: Colors.green,
            ),
            Details(
              label: 'Critical',
              status: '5K',
              color: Colors.orange,
            ),
            Details(
              label: 'Recovered',
              status: '1M',
              color: Colors.green,
            ),
            Details(
              label: 'Deaths',
              status: '10K',
              color: Colors.red,
            ),
          ],
        );
      },
    );
  }
}
