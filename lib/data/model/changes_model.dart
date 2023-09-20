import 'dart:convert';

import 'package:gpa_pro/data/model/change_calc.dart';
import 'package:gpa_pro/data/model/subject_model.dart';

enum ChangeType {
  updateSubject,
  addManySubjects,
  deleteManySubjects,
  changeCalcSubjects,
}

class ChangesInSubjects {
  final int? id;
  final ChangeType changeType;
  final List<SubjectModel> subjects;
  final ChangeCalc? changeCalc;

  const ChangesInSubjects({
    this.id,
    required this.changeType,
    required this.subjects,
    this.changeCalc,
  });

  static const String changeTypeKey = "changeTypeKey";
  static const String changeCalcKey = "changeCalcKey";
  static const String subjectsKey = "subjectsKey";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data[changeTypeKey] = changeType.index;
    data[changeCalcKey] = changeCalc?.toJson();
    data[subjectsKey] = json.encode(subjects);

    return data;
  }

  String toRawJson() => json.encode(toJson());

  factory ChangesInSubjects.fromJson(Map<String, dynamic> map) {
    List<SubjectModel> temp = [];
    for (Map<String, dynamic> e in json.decode(map[subjectsKey])) {
      temp.add(SubjectModel.fromJson(e));
    }
    return ChangesInSubjects(
      id: map['id'],
      changeType: ChangeType.values[map[changeTypeKey]],
      changeCalc: map[changeCalcKey] == null
          ? null
          : ChangeCalc.fromJson(map[changeCalcKey]),
      subjects: temp,
    );
  }
  factory ChangesInSubjects.fromRawJson(String str) =>
      ChangesInSubjects.fromJson(json.decode(str));
}
