import 'package:flutter/material.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/core/utils/shadows.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Заметки',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          DecoratedBox(
            decoration: const BoxDecoration(
              boxShadow: AppShadows.mainShadow,
            ),
            child: TextField(
              maxLines: 4,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Введите заметку',
                hintStyle: const TextStyle(
                  color: AppColors.grey,
                ),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
