import 'package:flutter/material.dart';
import 'package:moodiary/core/utils/colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundWhite,
      foregroundColor: AppColors.grey,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    ),
    fontFamily: 'Nunito',
  );
}
