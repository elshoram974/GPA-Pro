import 'package:gpa_pro/data/datasource/database/grades/grade_table_db.dart';
import 'package:flutter/material.dart';

class Grade {
  int id;
  String grade;
  double gpa;
  double degree;
  Color? lightColor;
  Color? darkColor;

  Grade({
    required this.id,
    required this.grade,
    required this.gpa,
    required this.degree,
    this.lightColor,
    this.darkColor,
  });

  bool isEqual(Grade otherGrade) {
    return id == otherGrade.id && grade == otherGrade.grade;
  }

  bool isAllEqual(Grade otherGrade) {
    return grade == otherGrade.grade &&
        degree == otherGrade.degree &&
        gpa == otherGrade.gpa &&
        lightColor == otherGrade.lightColor &&
        darkColor == otherGrade.darkColor;
  }

  factory Grade.getNewEmpty({int? id}) => Grade(
        id: id ?? 0,
        grade: "",
        gpa: 0.0,
        degree: 0.0,
      );

  factory Grade.fromJson(Map<String, dynamic> map) => Grade(
        id: map[GradeTableDB.id] ?? 0,
        grade: map[GradeTableDB.grade] ?? "",
        gpa: map[GradeTableDB.gpa] ?? 0.0,
        degree: map[GradeTableDB.degree] ?? 0.0,
        lightColor: map[GradeTableDB.lightColor] == null
            ? null
            : Color(int.parse("${map[GradeTableDB.lightColor]}")), // "0xff----"
        darkColor: map[GradeTableDB.darkColor] == null
            ? null
            : Color(int.parse("${map[GradeTableDB.darkColor]}")), // "0xff----"
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[GradeTableDB.id] = id;
    data[GradeTableDB.grade] = grade;
    data[GradeTableDB.gpa] = gpa;
    data[GradeTableDB.degree] = degree;
    data[GradeTableDB.lightColor] = lightColor?.value;
    data[GradeTableDB.darkColor] = darkColor?.value;
    return data;
  }

  Map<String, dynamic> toMapWithoutId() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[GradeTableDB.grade] = grade;
    data[GradeTableDB.gpa] = gpa;
    data[GradeTableDB.degree] = degree;
    data[GradeTableDB.lightColor] = lightColor?.value;
    data[GradeTableDB.darkColor] = darkColor?.value;
    return data;
  }
}
