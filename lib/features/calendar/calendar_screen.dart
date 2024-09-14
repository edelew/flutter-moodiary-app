import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodiary/app/extensions/date_time_func.dart';
import 'package:moodiary/app/notifiers/date_notifier.dart';
import 'package:moodiary/core/utils/icons.dart';
import 'package:moodiary/features/calendar/presentation/widgets/calendar_widget.dart';
import 'package:moodiary/features/calendar/presentation/widgets/week_days_widget.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcons.close,
            width: 16,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => onTodayTap(context),
            child: const Text(
              'Сегодня',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            WeekDaysWidget(),
            Expanded(
              child: CalendarWidget(),
            ),
          ],
        ),
      ),
    );
  }

  void onTodayTap(BuildContext context) {
    final today = DateTimeFunc.today();
    context.read<DateNotifier>().changeDate(today);
    Navigator.of(context).pop();
  }
}
