import 'dart:convert';

import 'package:gpa_pro/data/model/subject_model.dart';

class ChangeCalc {
  ChangeCalc({
    this.id,
    required this.makeCalculated,
    required this.subjects,
  });
  final int? id;
  final bool makeCalculated;
  final List<SubjectModel> subjects;

  static const String makeCalculatedKey = "makeCalculated";
  static const String subjectsKey = "subjectsKey";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data[makeCalculatedKey] = makeCalculated;
    data[subjectsKey] = json.encode(subjects);

    return data;
  }

  String toRawJson() => json.encode(toJson());

  factory ChangeCalc.fromJson(Map<String, dynamic> map) {
    List<SubjectModel> temp = [];
    for (Map<String, dynamic> e in json.decode(map[subjectsKey])) {
      temp.add(SubjectModel.fromJson(e));
    }
    return ChangeCalc(
      id: map['id'],
      makeCalculated: map[makeCalculatedKey],
      subjects: temp,
      // subjects: json.decode(map[subjectsKey]),
    );
  }
  factory ChangeCalc.fromRawJson(String str) =>
      ChangeCalc.fromJson(json.decode(str));
}
