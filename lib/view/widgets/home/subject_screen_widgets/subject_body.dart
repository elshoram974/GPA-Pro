import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/address_widget.dart';
import 'package:gpa_pro/core/shared/fill_max_first_text_widget.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_grade_degree_gpa.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_hours_max_degree.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_is_calc.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_name.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_notes_field.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_sub_max_degrees.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_sub_subject_degrees.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_total_gpa_percentage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectBody extends StatelessWidget {
  const SubjectBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectControllerImp>(
      builder: (controller) {
        return Form(
          key: controller.formKey,
          child: CustomBodyListView(
            children: [
              AddressWidget(address: controller.thisSubject.address),
              const FillMaxFirstTextWidget(),
              SubjectName(controller),
              SubjectHoursMaxDegree(controller),
              SubjectGradeDegreeGPA(controller),
              const SubjectTotalGPAPercentage(),
              SubjectSubMaxDegrees(controller),
              SubjectSubSubjectDegrees(controller),
              const SizedBox(height: AppConstant.kDefaultPadding),
              const SubjectIsCalCulated(),
              const SubjectNotesField(),
              const SizedBox(height: 2 * AppConstant.kDefaultPadding),
            ],
          ),
        );
      },
    );
  }
}
