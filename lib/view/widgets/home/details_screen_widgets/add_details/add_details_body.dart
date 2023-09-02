import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/add_details/gpa_add_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/add_details/grade_add_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/add_details/hours_add_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/add_details/subject_add_details.dart';
import 'package:flutter/material.dart';

class AddDetailsBody extends StatelessWidget {
  const AddDetailsBody({super.key, required this.arguments});
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    GPAFunctionsHelper allSubjects;
    allSubjects = GPAFunctionsHelper(AppInjections.homeController.subjects);

    return CustomBodyListView(
      children: [
        HoursAddDetails(allSubjects: allSubjects, arguments: arguments),
        SubjectsAddDetails(arguments: arguments),
        GPAAddDetails(arguments: arguments, allSubjects: allSubjects),
        GradeAddDetails(allSubjects: allSubjects, arguments: arguments),
      ],
    );
  }
}
