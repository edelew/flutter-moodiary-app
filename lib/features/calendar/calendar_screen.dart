import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/core/utils/icons.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Сегодня',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
          child: Column(
            children: [
              WeekDaysWidget(),
              Expanded(
                child: CalendarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeekDaysWidget extends StatelessWidget {
  const WeekDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weekdays = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(weekdays.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            weekdays[index],
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final startDate = DateTime.now();

    final allMonths = List.generate(24 + (13 - startDate.month), (index) {
      return DateTime(startDate.year, startDate.month + index, 1);
    });

    return ListView.builder(
      // itemCount: 24 + (12 - startDate.month),
      itemCount: allMonths.length,
      itemBuilder: (context, index) {
        return MonthCardWidget(
          monthStartDate: allMonths[index],
        );
      },
    );
  }
}

class MonthCardWidget extends StatelessWidget {
  const MonthCardWidget({
    super.key,
    required this.monthStartDate,
  });

  final DateTime monthStartDate;

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateTime(monthStartDate.year, monthStartDate.month + 1, 0).day;
    final weekdayOfFirstDay = monthStartDate.weekday;

    final months = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь',
    ];

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
            months[monthStartDate.month - 1],
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
                mainAxisSpacing: 8),
            itemBuilder: (context, index) {
              if (weekdayOfFirstDay > index + 1) {
                return const SizedBox();
              } else {
                return Center(
                  child: Text(
                    '${index - (weekdayOfFirstDay - 2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
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
