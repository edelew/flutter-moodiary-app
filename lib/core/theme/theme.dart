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

    // fontFamily: 'Jost',
  );
}



// double? trackHeight,
//   Color? activeTrackColor,
//   Color? inactiveTrackColor,
//   Color? secondaryActiveTrackColor,
//   Color? disabledActiveTrackColor,
//   Color? disabledInactiveTrackColor,
//   Color? disabledSecondaryActiveTrackColor,
//   Color? activeTickMarkColor,
//   Color? inactiveTickMarkColor,
//   Color? disabledActiveTickMarkColor,
//   Color? disabledInactiveTickMarkColor,
//   Color? thumbColor,
//   Color? overlappingShapeStrokeColor,
//   Color? disabledThumbColor,
//   Color? overlayColor,
//   Color? valueIndicatorColor,
//   Color? valueIndicatorStrokeColor,
//   SliderComponentShape? overlayShape,
//   SliderTickMarkShape? tickMarkShape,
//   SliderComponentShape? thumbShape,
//   SliderTrackShape? trackShape,
//   SliderComponentShape? valueIndicatorShape,
//   RangeSliderTickMarkShape? rangeTickMarkShape,
//   RangeSliderThumbShape? rangeThumbShape,
//   RangeSliderTrackShape? rangeTrackShape,
//   RangeSliderValueIndicatorShape? rangeValueIndicatorShape,
//   ShowValueIndicator? showValueIndicator,
//   TextStyle? valueIndicatorTextStyle,
//   double? minThumbSeparation,
//   Thumb? Function(TextDirection, RangeValues, double, Size, Size, double)? thumbSelector,
//   WidgetStateProperty<MouseCursor?>? mouseCursor,
//   SliderInteraction? allowedInteraction,