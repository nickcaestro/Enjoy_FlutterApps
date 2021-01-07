import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String icon;
  final String status;
  final String label;
  final Color color;

  StatusCard({this.icon, this.status, this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          icon,
          height: 60,
        ),
        Text(
          status,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
