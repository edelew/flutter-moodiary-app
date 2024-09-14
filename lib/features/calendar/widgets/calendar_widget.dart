import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moodiary/app/extensions/date_time_func.dart';
import 'package:moodiary/app/notifiers/date_notifier.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final date = context.watch<DateNotifier>().date;

    final startDate = DateTimeFunc.today();
    final allMonths = List.generate(24 + (13 - startDate.month), (index) {
      return DateTime(startDate.year, startDate.month + index, 1);
    });

    return ListView.builder(
      itemCount: allMonths.length,
      itemBuilder: (context, index) {
        return MonthCardWidget(
          monthStartDate: allMonths[index],
          currentDate: date,
          onDateTap: (newDate) {
            context.read<DateNotifier>().changeDate(newDate);
          },
        );
      },
    );
  }
}

class MonthCardWidget extends StatelessWidget {
  const MonthCardWidget({
    super.key,
    required this.monthStartDate,
    required this.currentDate,
    required this.onDateTap,
  });

  final DateTime monthStartDate;
  final DateTime currentDate;
  final void Function(DateTime newDate) onDateTap;

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateTime(monthStartDate.year, monthStartDate.month + 1, 0).day;
    final weekdayOfFirstDay = monthStartDate.weekday;

    var monthName = DateFormat.MMMM('ru_RU').format(monthStartDate);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${monthStartDate.year}',
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            toBeginningOfSentenceCase(monthName),
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: daysInMonth + (weekdayOfFirstDay - 1),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              if (weekdayOfFirstDay > index + 1) {
                return const SizedBox();
              } else {
                final day = index - (weekdayOfFirstDay - 2);
                final dateOfMonth =
                    DateTime(monthStartDate.year, monthStartDate.month, day);

                var today = DateTimeFunc.today();

                return GestureDetector(
                  onTap: () {
                    onDateTap(dateOfMonth);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (dateOfMonth == currentDate)
                        // Подсвечивание
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.lightTangerine,
                            shape: BoxShape.circle,
                          ),
                          child: SizedBox(
                            width: 38,
                            height: 38,
                          ),
                        ),
                      if (dateOfMonth == today)
                        // Точка
                        const Positioned(
                          bottom: 3,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.tangerine,
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(
                              width: 5,
                              height: 5,
                            ),
                          ),
                        ),
                      Text(
                        '$day',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
