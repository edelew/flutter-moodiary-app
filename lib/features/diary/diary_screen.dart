import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodiary/utils/assets/icons/app_icons.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: SvgPicture.asset(AppIcons.calendar),
        title: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text('1 января 09:00'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(AppIcons.calendar),
            ),
          ],
        ),
      ),
    );
  }
}
