import 'package:flutter/material.dart';
import 'package:moodiary/features/diary/data/entities/save_entity.dart';

class SaveNotifier extends ChangeNotifier {
  var _saveData = SaveEntity();
  SaveEntity get saveData => _saveData;

  void updateData({
    List<String>? feelingTags,
    double? stressValue,
    double? selfesteemValue,
    String? note,
  }) {
    _saveData = _saveData.copyWith(
      feelingTags: feelingTags,
      stressValue: stressValue,
      selfesteemValue: selfesteemValue,
      note: note,
    );
    notifyListeners();
  }
}
