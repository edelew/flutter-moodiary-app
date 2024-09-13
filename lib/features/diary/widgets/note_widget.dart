import 'package:flutter/material.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/core/utils/shadows.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({
    super.key,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.updateData,
  });

  final double horizontalPadding;
  final double verticalPadding;
  final void Function(String newValue) updateData;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  late final TextEditingController noteController;

  @override
  void initState() {
    noteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
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
              controller: noteController,
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
              onChanged: (value) {
                widget.updateData(value.trim());
              },
            ),
          ),
        ],
      ),
    );
  }
}
