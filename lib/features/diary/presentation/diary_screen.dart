import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:moodiary/app/notifiers/date_notifier.dart';
import 'package:moodiary/app/services/snack_bar_service.dart';
import 'package:moodiary/features/calendar/presentation/calendar_screen.dart';
import 'package:moodiary/features/diary/data/mock_data/feeling_mock_data.dart';
import 'package:moodiary/features/diary/presentation/notifiers/save_notifier.dart';
import 'package:moodiary/features/diary/presentation/widgets/feeling_widget.dart';
import 'package:moodiary/core/utils/icons.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/features/diary/presentation/widgets/mood_slider_widget.dart';
import 'package:moodiary/features/diary/presentation/widgets/note_widget.dart';
import 'package:moodiary/features/diary/presentation/widgets/save_button_widget.dart';
import 'package:moodiary/features/diary/presentation/widgets/tab_bar_widget.dart';
import 'package:provider/provider.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  bool isMain = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SaveNotifier(),
      child: Consumer<SaveNotifier>(
        builder: (context, saveNotifier, child) {
          final isFull = saveNotifier.saveData.isFull();
          final date = context.watch<DateNotifier>().date;

          var formattedDate = DateFormat.yMMMMd('ru_RU').format(date);

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CalendarScreen(),
                          ),
                        );
                      },
                      child: SvgPicture.asset(
                        AppIcons.calendar,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBarWidget(
                  verticalPadding: 14,
                  onTab: () {
                    setState(() {
                      isMain = !isMain;
                    });
                  },
                ),
                isMain
                    ? MainSectionWidget(
                        feelings: FeelingMockData.feelings,
                        isFull: isFull,
                      )
                    : const StatisticSectionWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MainSectionWidget extends StatelessWidget {
  const MainSectionWidget({
    super.key,
    required this.feelings,
    required this.isFull,
  });

  final List<FeelingEntity> feelings;
  final bool isFull;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            FeelingWidget(
              feelings: feelings,
              horizontalPadding: 20,
              verticalPadding: 16,
              updateData: (newValue) {
                context.read<SaveNotifier>().updateData(feelingTags: newValue);
              },
            ),
            MoodSliderWidget(
              title: 'Уровень стресса',
              minValue: 'Низкий',
              maxValue: 'Высокий',
              horizontalPadding: 20,
              verticalPadding: 16,
              updateData: (newValue) {
                context.read<SaveNotifier>().updateData(stressValue: newValue);
              },
            ),
            MoodSliderWidget(
              title: 'Самооценка',
              minValue: 'Неуверенность',
              maxValue: 'Уверенность',
              horizontalPadding: 20,
              verticalPadding: 16,
              updateData: (newValue) {
                context
                    .read<SaveNotifier>()
                    .updateData(selfesteemValue: newValue);
              },
            ),
            NoteWidget(
              horizontalPadding: 20,
              verticalPadding: 16,
              updateData: (newValue) {
                context.read<SaveNotifier>().updateData(note: newValue);
              },
            ),
            SaveButtonWidget(
              horizontalPadding: 20,
              verticalPadding: 16,
              isAble: isFull,
              onTap: () {
                SnackBarService.showSnackBar(context, 'Данные сохранены');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticSectionWidget extends StatelessWidget {
  const StatisticSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Center(
        child: SvgPicture.asset(
          AppIcons.statistics,
          width: 80,
        ),
      ),
    );
  }
}
