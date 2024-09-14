import 'package:flutter/material.dart';
import 'package:moodiary/app/extensions/date_time_func.dart';

class DateNotifier extends ChangeNotifier {
  var _date = DateTimeFunc.today();
  DateTime get date => _date;

  void changeDate(DateTime newDate) {
    _date = newDate;
    notifyListeners();
  }
}
