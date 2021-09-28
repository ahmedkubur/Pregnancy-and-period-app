import 'package:flutter/material.dart';

class PeriodProvider with ChangeNotifier {
  DateTime _periodDate = DateTime.now();

  DateTime get periodDate => _periodDate;

  void savePeriod(date) {
    _periodDate = date.add(new Duration(days: 30));
    notifyListeners();
  }
}
