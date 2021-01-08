import 'package:flutter/foundation.dart';
import '../models/report.dart';

class Reports with ChangeNotifier {
  List<Report> _reports = [
    Report(
      country: 'USA',
      totalCases: '200000',
      newCases: '30000',
      activeCases: '100000',
      criticalCases: '20000',
      recoveredCases: '100000',
      totalDeaths: '3000',
    ),
    Report(
      country: 'Canada',
      totalCases: '600000',
      newCases: '2000',
      activeCases: '300000',
      criticalCases: '50000',
      recoveredCases: '200000',
      totalDeaths: '5000',
    ),
  ];

  List<Report> get reports {
    return [..._reports];
  }

  Report _globalCases = Report(
    country: 'Global',
    totalCases: '350000',
    newCases: '35000',
    activeCases: '900000',
    criticalCases: '70000',
    recoveredCases: '300000',
    totalDeaths: '100000',
  );

  Report get globalCases {
    return _globalCases;
  }
}
