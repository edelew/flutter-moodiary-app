import 'package:flutter/material.dart';

class SaveNotifier extends ChangeNotifier {
  var _saveData = SaveData();
  SaveData get saveData => _saveData;

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

class SaveData {
  SaveData({
    List<String>? feelingTags,
    this.stressValue,
    this.selfesteemValue,
    this.note = '',
  }) : feelingTags = feelingTags ?? [];

  final List<String> feelingTags;
  final double? stressValue;
  final double? selfesteemValue;
  final String note;

  SaveData copyWith({
    List<String>? feelingTags,
    double? stressValue,
    double? selfesteemValue,
    String? note,
  }) {
    return SaveData(
      feelingTags: feelingTags ?? this.feelingTags,
      stressValue: stressValue ?? this.stressValue,
      selfesteemValue: selfesteemValue ?? this.selfesteemValue,
      note: note ?? this.note,
    );
  }

  bool isFull() {
    if (feelingTags.isNotEmpty &&
        stressValue != null &&
        selfesteemValue != null &&
        note != '') {
      return true;
    } else {
      return false;
    }
  }
}
