import 'package:flutter/material.dart';
import 'package:moodiary/core/utils/colors.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
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
      child: SizedBox(
        width: double.infinity,
        height: 44,
        child: ElevatedButton(
          onPressed: () {},
          focusNode: FocusNode(),
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.white,
            backgroundColor: AppColors.tangerine,
            disabledForegroundColor: AppColors.grey,
            disabledBackgroundColor: AppColors.grey4,
            elevation: 0,
          ),
          child: Text('Сохранить'),
        ),
      ),
    );
  }
}
