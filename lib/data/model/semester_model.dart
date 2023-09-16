import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:get/get.dart';

class SemesterModel extends ParentModel {
  final String year;

  final List<SubjectModel> subjects;

  SemesterModel({
    required this.subjects,
    required int id,
    required String name,
    required this.year,
    bool isSelected = false,
    bool isNeedSync = true,
    bool isCalculated = true,
    bool isCanceled = false,
  }) : super(
          id: id,
          name: name,
          hours: GPAFunctions.noHours(subjects),
          degree: GPAFunctions.cumulative(subjects, isGpa: false),
          gpa: GPAFunctions.cumulative(subjects),
          maxDegree: GPAFunctions.cumulativeMaxDegree(subjects),
          address: ".../${year.tr}/${name.tr}",
          isCalculated: isCalculated,
          isSelected: isSelected,
          isNeedSync: isNeedSync,
        );

  bool isEqual(SemesterModel otherSemester) {
    return id == otherSemester.id && name == otherSemester.name;
  }

  factory SemesterModel.getNewEmpty() => SemesterModel(
        id: 0,
        name: "",
        year: '',
        subjects: [],
      );

  static List<String> get semesters => [
        AppConstLang.firstSemester,
        AppConstLang.secondSemester,
        AppConstLang.summerSemester,
      ];
}
