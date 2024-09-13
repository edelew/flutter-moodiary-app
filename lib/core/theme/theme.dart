import 'package:flutter/material.dart';
import 'package:moodiary/core/utils/colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.grey,
      centerTitle: true,
    ),
    fontFamily: 'Nunito',
  );
}
