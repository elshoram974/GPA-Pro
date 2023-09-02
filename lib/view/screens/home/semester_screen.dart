import 'package:gpa_pro/controller/home/semester_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/default_body.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/view/widgets/home/semester_screen_widgets/semester_appbar.dart';
import 'package:gpa_pro/view/widgets/home/semester_screen_widgets/semester_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SemesterScreen extends StatelessWidget {
  const SemesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageArgument argument;
    argument = ModalRoute.of(context)?.settings.arguments as PageArgument;
    return GetBuilder<SemesterControllerImp>(
      builder: (controller) {
        controller.getThisSemester(argument.model as SemesterModel);
        return DefaultBody(
          onWillPop: controller.onWillPop,
          appBar: const SemesterAppBar(),
          body: const SemesterBody(),
          pageType: PageType.semesterScreen,
          modelList: controller.subjectsList,
          isEmptyBody: controller.subjectsList.isEmpty,
          textWhenEmptyBody: AppConstLang.addYear.tr,
          tooltipFloatingButton: AppConstLang.addYear.tr,
          addIsAvailable: true,
          onPressedFloatingButton: controller.onPressedFloatingButton,
        );
      },
    );
  }
}
