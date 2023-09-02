import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/home_details/cumulative_home_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/home_details/grade_home_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/home_details/hours_home_details.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/home_details/subject_home_details.dart';
import 'package:flutter/material.dart';

class HomeDetailsBody extends StatelessWidget {
  const HomeDetailsBody({super.key, required this.arguments});
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    GPAFunctionsHelper allSubjects;
    allSubjects = GPAFunctionsHelper(AppInjections.homeController.subjects);

    return CustomBodyListView(
      children: [
        HoursHomeDetails(allSubjects: allSubjects, arguments: arguments),
        SubjectsHomeDetails(allSubjects: allSubjects, arguments: arguments),
        CumulativeHomeDetails(allSubjects: allSubjects),
        GradeHomeDetails(allSubjects: allSubjects),
      ],
    );
  }
}
