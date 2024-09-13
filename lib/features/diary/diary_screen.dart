import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodiary/features/diary/widgets/feeling_widget.dart';
import 'package:moodiary/core/utils/icons.dart';
import 'package:moodiary/core/utils/images.dart';
import 'package:moodiary/core/utils/colors.dart';
import 'package:moodiary/features/diary/widgets/mood_slider_widget.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

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

    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                '1 января 09:00',
                style: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                AppIcons.calendar,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          FeelingWidget(
            feelings: feelings,
            horizontalPadding: 20,
            verticalPadding: 0,
          ),
          const MoodSliderWidget(
            title: 'Уровень стресса',
            minValue: 'Низкий',
            maxValue: 'Высокий',
            horizontalPadding: 20,
            verticalPadding: 0,
          ),
        ],
      ),
    );
  }
}
