import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EditSubjectController extends GetxController {
  void onSelectAutoCompleteField(Object? suggestion, AutoCompleteType type);
  void fillControllersBySubject(SubjectModel subject);
  void onChanged(String? val, GradeType grade);
  void onChangedSubMaxDegree();
  void onChangedSubSubjectDegree();
  void clearSubMaxDegrees();
  void clearSubSubjectDegrees();
  void initControllers();
  void disposeControllers();
}

class EditSubjectControllerImp extends EditSubjectController {
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameEnController;
  late TextEditingController nameArController;
  late TextEditingController gpaController;
  late TextEditingController gradeController;
  late TextEditingController degreeController;
  late TextEditingController hoursController;
  late TextEditingController maxDegreeController;

  late TextEditingController myPracticalDegreeController; // عملي و شفوي
  late TextEditingController myYearWorkDegreeController; // اعمال السنة
  late TextEditingController myMidDegreeController;
  late TextEditingController myFinalDegreeController;

  late TextEditingController maxPracticalDegreeController; // عملي و شفوي
  late TextEditingController maxYearWorkDegreeController; // اعمال السنة
  late TextEditingController maxMidDegreeController;
  late TextEditingController maxFinalDegreeController;

  double? savedGPA;

  bool isCalculated = true;

  @override
  void onInit() {
    initControllers();
    // initialValue();
    super.onInit();
  }

  @override
  void onClose() {
    disposeControllers();
    super.onClose();
  }

  @override
  void onSelectAutoCompleteField(Object? suggestion, AutoCompleteType type) {
    switch (type) {
      case AutoCompleteType.name:
        SubjectModel subject = suggestion as SubjectModel;
        fillControllersBySubject(subject);

      case AutoCompleteType.grade:
        String grade = suggestion as String;
        gradeController.text = grade;
        onChanged(grade, GradeType.grade);
      default:
    }
  }

  @override
  void fillControllersBySubject(SubjectModel subject) {
    maxDegreeController.text = "${subject.maxDegree}";

    nameEnController.text = subject.nameEn;
    nameArController.text = subject.nameAr ?? "";
    gpaController.text = "${subject.gpa}";

    onChanged(gpaController.text, GradeType.gpa);

    degreeController.text = "${subject.degree}";
    hoursController.text = "${subject.hours}";

    myPracticalDegreeController.text =
        "${subject.myPracticalDegree ?? ""}"; // عملي و شفوي
    myYearWorkDegreeController.text =
        "${subject.myYearWorkDegree ?? ""}"; // اعمال السنة
    myMidDegreeController.text = "${subject.myMidDegree ?? ""}";
    myFinalDegreeController.text = "${subject.myFinalDegree ?? ""}";

    maxPracticalDegreeController.text =
        "${subject.maxPracticalDegree ?? ""}"; // عملي و شفوي
    maxYearWorkDegreeController.text =
        "${subject.maxYearWorkDegree ?? ""}"; // اعمال السنة
    maxMidDegreeController.text = "${subject.maxMidDegree ?? ""}";
    maxFinalDegreeController.text = "${subject.maxFinalDegree ?? ""}";
    isCalculated = subject.isCalculated;

    update();
  }

  @override
  void onChanged(String? val, GradeType grade) {
    double maxDegree = double.tryParse(maxDegreeController.text) ?? 100;
    double ratio = 0;
    savedGPA = null;
    if (grade == GradeType.grade) {
      ratio = double.tryParse(
              GPAFunctions.gradeResult(val!.trim(), grade, 1, retGpa: false)) ??
          0;
      degreeController.text = "${(maxDegree * ratio) / 100}";

      gpaController.text = GPAFunctions.gradeResult(val.trim(), grade, 1);
    } else if (grade == GradeType.degree) {
      double ratio = ((double.tryParse(val!.trim()) ?? 0) * 100) / maxDegree;

      gradeController.text = GPAFunctions.gradeResult("$ratio", grade, 1);

      gpaController.text = "${GPAFunctions.convertToGpa(ratio)}";
    } else {
      gradeController.text = GPAFunctions.gradeResult(val!.trim(), grade, 1);

      ratio = GPAFunctions.convertToDegree(double.tryParse(val.trim()) ?? 0);

      degreeController.text = "${(maxDegree * ratio) / 100}";
      savedGPA = double.tryParse(gpaController.text);
    }
  }

  @override
  void onChangedSubMaxDegree() {
    clearSubSubjectDegrees();
    double subMaxDegree = double.tryParse(maxDegreeController.text) ?? 100;

    double maxPracticalDegree =
        double.tryParse(maxPracticalDegreeController.text) ?? 0.0;

    double maxWorkYearDegree =
        double.tryParse(maxYearWorkDegreeController.text) ?? 0.0;

    double maxMidDegree = double.tryParse(maxMidDegreeController.text) ?? 0.0;

    double maxFinalDegree =
        double.tryParse(maxFinalDegreeController.text) ?? 0.0;

    subMaxDegree =
        maxPracticalDegree + maxWorkYearDegree + maxMidDegree + maxFinalDegree;

    maxDegreeController.text = "$subMaxDegree";
    onChanged(gradeController.text, GradeType.grade);
  }

  @override
  void onChangedSubSubjectDegree() {
    double subDegree = double.tryParse(degreeController.text) ?? 0.0;

    double practicalDegree =
        double.tryParse(myPracticalDegreeController.text) ?? 0.0;

    double workYearDegree =
        double.tryParse(myYearWorkDegreeController.text) ?? 0.0;

    double midDegree = double.tryParse(myMidDegreeController.text) ?? 0.0;

    double finalDegree = double.tryParse(myFinalDegreeController.text) ?? 0.0;

    subDegree = practicalDegree + workYearDegree + midDegree + finalDegree;

    // degreeController.text = "$subDegree";
    // onChanged(gradeController.text, GradeType.grade);
    degreeController.text = "$subDegree";
    onChanged(degreeController.text, GradeType.degree);
  }

  @override
  void clearSubMaxDegrees() {
    maxPracticalDegreeController.text = ""; // عملي و شفوي
    maxYearWorkDegreeController.text = ""; // اعمال السنة
    maxMidDegreeController.text = "";
    maxFinalDegreeController.text = "";
    clearSubSubjectDegrees();
  }

  @override
  void clearSubSubjectDegrees() {
    myPracticalDegreeController.text = ""; // عملي و شفوي
    myYearWorkDegreeController.text = ""; // اعمال السنة
    myMidDegreeController.text = "";
    myFinalDegreeController.text = "";
  }

  @override
  void initControllers() {
    nameEnController = TextEditingController();
    nameArController = TextEditingController();

    gpaController = TextEditingController();
    gradeController = TextEditingController();
    degreeController = TextEditingController();
    hoursController = TextEditingController();
    maxDegreeController = TextEditingController();

    myPracticalDegreeController = TextEditingController(); // عملي و شفوي
    myYearWorkDegreeController = TextEditingController(); // اعمال السنة
    myMidDegreeController = TextEditingController();
    myFinalDegreeController = TextEditingController();

    maxPracticalDegreeController = TextEditingController(); // عملي و شفوي
    maxYearWorkDegreeController = TextEditingController(); // اعمال السنة
    maxMidDegreeController = TextEditingController();
    maxFinalDegreeController = TextEditingController();
  }

  @override
  void disposeControllers() {
    nameEnController.dispose();
    nameArController.dispose();

    gradeController.dispose();
    degreeController.dispose();
    hoursController.dispose();
    maxDegreeController.dispose();
    gpaController.dispose();

    myPracticalDegreeController.dispose(); // عملي و شفوي
    myYearWorkDegreeController.dispose(); // اعمال السنة
    myMidDegreeController.dispose();
    myFinalDegreeController.dispose();

    maxPracticalDegreeController.dispose(); // عملي و شفوي
    maxYearWorkDegreeController.dispose(); // اعمال السنة
    maxMidDegreeController.dispose();
    maxFinalDegreeController.dispose();
  }
}
