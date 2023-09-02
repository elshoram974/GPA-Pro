import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/fill_max_first_text_widget.dart';
import 'package:gpa_pro/core/shared/my_label.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/sub_degrees/sub_max_degrees.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/sub_degrees/sub_subject_degrees.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubDegrees extends StatelessWidget {
  const SubDegrees({super.key, required this.dialogController});
  final DialogControllerImp dialogController;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(AppConstLang.moreOptions.tr),
      children: [
        // SizedBox(
        //   height: 40,
        //   child: Text(
        //     AppConstLang.dontCloseTillUSaveSubject.tr,
        //     style: TextStyle(color: Colors.red.shade600),
        //   ),
        // ),
        const FillMaxFirstTextWidget(),
        MyLabels(AppConstLang.maxDegrees.tr),
        SubMaxDegrees(dialogController: dialogController),
        MyLabels(AppConstLang.yourDegrees.tr),
        SubSubjectDegrees(dialogController: dialogController),
        SizedBox(height: AppConstant.kDefaultPadding),
      ],
    );
  }
}
