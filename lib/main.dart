import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:moodiary/app/presentation/moodiary_app.dart';

void main() {
  initializeDateFormatting('ru_RU', null)
      .then((_) => runApp(const MoodiaryApp()));
}
