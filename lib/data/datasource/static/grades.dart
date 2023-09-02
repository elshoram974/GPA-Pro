import 'package:gpa_pro/data/model/grades_model.dart';
import 'package:flutter/material.dart';

class GradesHelper {
  List<Grade> get staticGrades => _staticGrades;

  final List<Grade> _staticGrades = [
    Grade(
      id: 1,
      grade: "A+",
      gpa: 4.00,
      degree: 97.00,
      lightColor: Colors.green,
      darkColor: Colors.green.shade900,
    ),
    Grade(
      id: 2,
      grade: "A",
      gpa: 4.00,
      degree: 93.00,
      lightColor: Colors.green,
      darkColor: Colors.green.shade900,
    ),
    Grade(
      id: 3,
      grade: "A-",
      gpa: 3.70,
      degree: 89.00,
      lightColor: Colors.green,
      darkColor: Colors.green.shade900,
    ),
    Grade(id: 4, grade: "B+", gpa: 3.30, degree: 84.00),
    Grade(id: 5, grade: "B", gpa: 3.00, degree: 80.00),
    Grade(id: 6, grade: "B-", gpa: 2.70, degree: 76.00),
    Grade(id: 7, grade: "C+", gpa: 2.30, degree: 73.00),
    Grade(id: 8, grade: "C", gpa: 2.00, degree: 70.00),
    Grade(id: 9, grade: "C-", gpa: 1.70, degree: 67.00),
    Grade(
      id: 10,
      grade: "D+",
      gpa: 1.30,
      degree: 64.00,
      darkColor: Colors.grey.shade800,
      lightColor: Colors.grey.shade600,
    ),
    Grade(
      id: 11,
      grade: "D",
      gpa: 1.00,
      degree: 60.00,
      darkColor: Colors.grey.shade800,
      lightColor: Colors.grey.shade600,
    ),
    Grade(
      id: 12,
      grade: "F",
      gpa: 0.00,
      degree: 0.00,
      lightColor: Colors.red.shade700,
      darkColor: Colors.redAccent.shade700,
    ),
  ];
}
