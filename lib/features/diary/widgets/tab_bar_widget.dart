import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/core/utils/icons.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.verticalPadding,
  });

  final double verticalPadding;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  double position = 0;
  double indicatorWidth = 172;
  bool isMain = true;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 100);
    const double height = 30;
    const double mainWidth = 288;
    const double highIndicatorWidth = 172;
    const double lowIndicatorWidth = 116;

    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.verticalPadding,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey4,
              borderRadius: BorderRadius.all(
                Radius.circular(47),
              ),
            ),
            child: SizedBox(
              height: height,
              width: mainWidth,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            left: position,
            duration: duration,
            child: IndicatorWidget(
              indicatorWidth: indicatorWidth,
              indicatorHeight: height,
              duration: duration,
            ),
          ),
          Positioned(
            left: 16,
            child: TabButtonWidget(
              name: 'Дневник настроения',
              iconAssetName: AppIcons.diary,
              color: isMain ? AppColors.white : AppColors.grey,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(47),
              ),
              onTap: () => changePosition(
                highIndicatorWidth: highIndicatorWidth,
                lowIndicatorWidth: lowIndicatorWidth,
              ),
            ),
          ),
          Positioned(
            right: 16,
            child: TabButtonWidget(
              name: 'Статистика',
              iconAssetName: AppIcons.statistics,
              color: isMain ? AppColors.grey : AppColors.white,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(47),
              ),
              onTap: () => changePosition(
                highIndicatorWidth: highIndicatorWidth,
                lowIndicatorWidth: lowIndicatorWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changePosition({
    required double highIndicatorWidth,
    required double lowIndicatorWidth,
  }) {
    setState(() {
      if (position == 0) {
        indicatorWidth = lowIndicatorWidth;
        position = highIndicatorWidth;
      } else {
        indicatorWidth = highIndicatorWidth;
        position = 0;
      }

      isMain = !isMain;
    });
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.indicatorWidth,
    required this.indicatorHeight,
    required this.duration,
  });

  final double indicatorWidth;
  final double indicatorHeight;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.tangerine,
        borderRadius: BorderRadius.all(
          Radius.circular(47),
        ),
      ),
      child: AnimatedSize(
        duration: duration,
        child: SizedBox(
          height: indicatorHeight,
          width: indicatorWidth,
        ),
      ),
    );
  }
}

class TabButtonWidget extends StatelessWidget {
  const TabButtonWidget({
    super.key,
    required this.name,
    required this.iconAssetName,
    required this.color,
    required this.borderRadius,
    required this.onTap,
  });

  final String name;
  final String iconAssetName;
  final Color color;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconAssetName,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
