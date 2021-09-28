import 'package:flutter/material.dart';

class PregnancyProvider with ChangeNotifier {
  DateTime _periodDate1 = DateTime.now().add(Duration(days: 15));
  DateTime _periodDate2 = DateTime.now().add(Duration(days: 30));

  DateTime get date1 => _periodDate1;
  DateTime get date2 => _periodDate2;

  void savePregnancyDate(date) {
    _periodDate1 = date.add(new Duration(days: 15));
    _periodDate2 = date.add(new Duration(days: 30));
    notifyListeners();
  }
}
