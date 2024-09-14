import 'package:flutter/material.dart';
import 'package:moodiary/core/theme/theme.dart';
import 'package:moodiary/features/diary/diary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      //       routes: {
      //   '/': (context) => DiaryScreen(),
      //   '/calendar': (context) => CalendarScreen(),
      // },
      home: const DiaryScreen(),
    );
  }
}
