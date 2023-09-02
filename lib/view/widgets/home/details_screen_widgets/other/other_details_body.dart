import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/other/gpa_other_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/other/grade_other_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/other/hours_other_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/other/subject_other_details.dart';
import 'package:flutter/material.dart';

class OtherDetailsBody extends StatelessWidget {
  const OtherDetailsBody({super.key, required this.arguments});
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    GPAFunctionsHelper allSubjects;
    allSubjects = GPAFunctionsHelper(AppInjections.homeController.subjects);
    List<SubjectModel> subjects = [];

    if (arguments.pageType == PageType.yearScreen) {
      List<SemesterModel> semesters;
      semesters = arguments.modelList as List<SemesterModel>;

      for (SemesterModel term in semesters) {
        subjects.addAll(term.subjects);
      }
    } else {
      subjects.addAll(arguments.modelList as List<SubjectModel>);
    }

    GPAFunctionsHelper modelFn = GPAFunctionsHelper(subjects);

    return CustomBodyListView(
      children: [
        HoursOtherDetails(allSubjects: allSubjects, modelFn: modelFn),
        SubjectsOtherDetails(modelFn: modelFn),
        GPAOtherDetails(modelFn: modelFn, allSubjects: allSubjects),
        GradeOtherDetails(allSubjects: allSubjects, modelFn: modelFn),
      ],
    );
  }
}
