import 'package:flutter/material.dart';
import 'package:moodiary/core/utils/colors.dart';

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
