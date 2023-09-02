import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/grade_degree_gpa.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/hours_max_degree.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/is_calculated_check_box.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/name_fields.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/sub_degrees/sub_degrees.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DialogControllerImp>(
      builder: (dialogController) => Form(
        key: dialogController.formKey,
        child: Column(
          children: [
            NameFields(dialogController: dialogController),
            HoursMaxDegree(dialogController: dialogController),
            GradeDegreeGPA(dialogController: dialogController),
            SubDegrees(dialogController: dialogController),
            IsCalCulated(dialogController: dialogController),
          ],
        ),
      ),
    );
  }
}
