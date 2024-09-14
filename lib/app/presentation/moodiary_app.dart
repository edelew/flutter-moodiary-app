import 'package:flutter/material.dart';
import 'package:moodiary/app/notifiers/date_notifier.dart';
import 'package:moodiary/core/theme/theme.dart';
import 'package:moodiary/features/diary/presentation/diary_screen.dart';
import 'package:provider/provider.dart';

class MoodiaryApp extends StatelessWidget {
  const MoodiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DateNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DiaryScreen(),
      ),
    );
  }
}
