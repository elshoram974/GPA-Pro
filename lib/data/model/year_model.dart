import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:get/get.dart';

class YearModel extends ParentModel {
  final List<SemesterModel> semesters;

  YearModel({
    required this.semesters,
    required int id,
    required String name,
    bool isSelected = false,
    bool isCalculated = true,
    bool isCanceled = false,
  }) : super(
          id: id,
          name: name,
          degree: GPAFunctions.cumulative(semesters, isGpa: false),
          hours: GPAFunctions.noHours(semesters),
          gpa: GPAFunctions.cumulative(semesters),
          maxDegree: GPAFunctions.cumulativeMaxDegree(semesters),
          address: ".../${name.tr}",
          isCalculated: isCalculated,
          isSelected: isSelected,
        );

  bool isEqual(YearModel otherYear) {
    return id == otherYear.id && name == otherYear.name;
  }

  factory YearModel.getNewEmpty() => YearModel(
        id: 0,
        name: "",
        semesters: [],
      );

  static List<String> get years => [
        // "primary",
        AppConstLang.preparatoryYear,
        AppConstLang.firstYear,
        AppConstLang.secondYear,
        AppConstLang.thirdYear,
        AppConstLang.fourthYear,
        AppConstLang.fifthYear,
        AppConstLang.sixthYear,
      ];
}
