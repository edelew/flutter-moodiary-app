import 'package:flutter/material.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/core/utils/shadows.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MoodSliderWidget extends StatefulWidget {
  const MoodSliderWidget({
    super.key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  final String title;
  final String minValue;
  final String maxValue;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  State<MoodSliderWidget> createState() => _MoodSliderWidgetState();
}

class _MoodSliderWidgetState extends State<MoodSliderWidget> {
  double currentValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          const SizedBox(height: 16),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
              boxShadow: AppShadows.mainShadow,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => const SizedBox(
                          height: 8,
                          width: 2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: AppColors.grey5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 6,
                      activeTrackColor: AppColors.tangerine,
                      thumbShape: PolygonSliderThumb(thumbRadius: 11),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 1.0),
                    ),
                    child: Slider(
                        value: currentValue,
                        onChanged: (newValue) {
                          setState(() {
                            currentValue = newValue;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.minValue,
                          style: TextStyle(
                            color: AppColors.grey3,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          widget.maxValue,
                          style: TextStyle(
                            color: AppColors.grey3,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PolygonSliderThumb extends SliderComponentShape {
  final double thumbRadius;

  const PolygonSliderThumb({
    required this.thumbRadius,
  });

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final circlePaint1 = Paint()..color = AppColors.white;
    final circlePaint2 = Paint()..color = AppColors.tangerine;

    canvas.drawCircle(center, thumbRadius, circlePaint1);
    canvas.drawCircle(center, thumbRadius / 1.8, circlePaint2);
  }

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }
}
