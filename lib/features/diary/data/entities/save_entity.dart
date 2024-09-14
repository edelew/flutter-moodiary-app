class SaveEntity {
  SaveEntity({
    List<String>? feelingTags,
    this.stressValue,
    this.selfesteemValue,
    this.note = '',
  }) : feelingTags = feelingTags ?? [];

  final List<String> feelingTags;
  final double? stressValue;
  final double? selfesteemValue;
  final String note;

  SaveEntity copyWith({
    List<String>? feelingTags,
    double? stressValue,
    double? selfesteemValue,
    String? note,
  }) {
    return SaveEntity(
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
