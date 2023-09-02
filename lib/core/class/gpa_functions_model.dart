import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';

class GPAFunctionsHelper {
  final List<ParentModel> modelList;
  const GPAFunctionsHelper(this.modelList);

  bool isAllCalculated() => GPAFunctions.isCalculated(modelList);
  int calculatedLength() => GPAFunctions.calculatedLength(modelList, true);
  int notCalculatedLength() => GPAFunctions.calculatedLength(modelList, false);

  Future<void> makeCalculated(bool isCalculated) async {
    assert(modelList is List<SubjectModel>);
    GPAFunctions.makeCalculated(modelList as List<SubjectModel>, isCalculated);
  }

  int noHours() => GPAFunctions.noHours(modelList);
  double gpaCumulative() => GPAFunctions.cumulative(modelList);
  double degreeCumulative() => GPAFunctions.cumulative(modelList, isGpa: false);
  double maxDegreeCumulative() => GPAFunctions.cumulativeMaxDegree(modelList);

  String grade() {
    return GPAFunctions.gradeResult(
      "${gpaCumulative()}",
      GradeType.gpa,
      noHours(),
    );
  }

  Color color(BuildContext context, {bool inList = true}) {
    return GPAFunctions.color(
      context,
      gpaCumulative(),
      noHours(),
      isAllCalculated(),
      inList: inList,
    );
  }

  PdfColor? pdfColor() {
    return PdfColor.fromInt(
      GPAFunctions.color(
        Get.context!,
        gpaCumulative(),
        noHours(),
        isAllCalculated(),
        inList: true,
      ).value,
    );
  }
}
