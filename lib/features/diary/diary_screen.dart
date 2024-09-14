import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:moodiary/app/notifiers/date_notifier.dart';
import 'package:moodiary/app/servises/snack_bar_service.dart';
import 'package:moodiary/features/calendar/calendar_screen.dart';
import 'package:moodiary/features/diary/notifiers/save_notifier.dart';
import 'package:moodiary/features/diary/widgets/feeling_widget.dart';
import 'package:moodiary/core/utils/icons.dart';
import 'package:moodiary/core/utils/images.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/features/diary/widgets/mood_slider_widget.dart';
import 'package:moodiary/features/diary/widgets/note_widget.dart';
import 'package:moodiary/features/diary/widgets/save_button_widget.dart';
import 'package:moodiary/features/diary/widgets/tab_bar_widget.dart';
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
    final feelings = [
      Feeling(
        image: AppImages.joy,
        name: 'Радость',
        tags: [
          'Возбуждение',
          'Восторг',
          'Игривость',
          'Наслаждение',
          'Очарование',
          'Осознанность',
          'Смелость',
          'Удовольствие',
          'Чувственность',
          'Энергичность',
          'Экстравагантность',
        ],
      ),
      Feeling(
        image: AppImages.fear,
        name: 'Страх',
        tags: [
          'Напряжение',
          'Оцепенение',
          'Тревожность',
          'Одиночество',
          'Уязвимость',
          'Растерянность',
          'Беспомощность',
          'Подавленность',
          'Недоверие',
        ],
      ),
      Feeling(
        image: AppImages.rabies,
        name: 'Бешенство',
        tags: [
          'Ярость',
          'Гнев',
          'Одержимость',
          'Вспыльчивость',
          'Потеря контроля',
          'Агрессия',
        ],
      ),
      Feeling(
        image: AppImages.sadness,
        name: 'Грусть',
        tags: [
          'Печаль',
          'Меланхолия',
          'Одиночество',
          'Тоска',
          'Опустошение',
          'Ностальгия',
          'Уныние',
          'Сожаление',
          'Разочарование',
        ],
      ),
      Feeling(
        image: AppImages.serenity,
        name: 'Спокойствие',
        tags: [
          'Умиротворение',
          'Гармония',
          'Равновесие',
          'Тишина',
          'Безмятежность',
          'Баланс',
          'Расслабленность',
          'Стабильность',
          'Ясность',
          'Непоколебимость',
        ],
      ),
      Feeling(
        image: AppImages.strength,
        name: 'Сила',
        tags: [
          'Стойкость',
          'Воля',
          'Энергия',
          'Уверенность',
          'Решимость',
          'Влияние',
          'Выносливость',
          'Дерзость',
        ],
      ),
    ];

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
                    ? MainSectionWidget(feelings: feelings, isFull: isFull)
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

  final List<Feeling> feelings;
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
