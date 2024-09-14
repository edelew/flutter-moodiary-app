import 'package:moodiary/core/utils/images.dart';
import 'package:moodiary/features/diary/data/entities/feeling_entity.dart';

abstract class FeelingMockData {
  static final feelings = [
    FeelingEntity(
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
    FeelingEntity(
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
    FeelingEntity(
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
    FeelingEntity(
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
    FeelingEntity(
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
    FeelingEntity(
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
}
