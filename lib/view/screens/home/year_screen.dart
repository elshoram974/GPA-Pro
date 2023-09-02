import 'package:gpa_pro/controller/home/year_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/default_body.dart';
import 'package:gpa_pro/data/model/year_model.dart';
import 'package:gpa_pro/view/widgets/home/year_screen_widgets/year_appbar.dart';
import 'package:gpa_pro/view/widgets/home/year_screen_widgets/year_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YearScreen extends StatelessWidget {
  const YearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageArgument argument;
    argument = ModalRoute.of(context)?.settings.arguments as PageArgument;
    return GetBuilder<YearControllerImp>(
      builder: (controller) {
        controller.getSemesters(argument.model as YearModel);

        return DefaultBody(
          onWillPop: controller.onWillPop,
          appBar: const YearAppBar(),
          body: const YearBody(),
          pageType: PageType.yearScreen,
          modelList: controller.semesterList,
          isEmptyBody: controller.semesterList.isEmpty,
          textWhenEmptyBody: AppConstLang.addSemester.tr,
          tooltipFloatingButton: AppConstLang.addSemester.tr,
          addIsAvailable: controller.semesterList.length < 3,
          onPressedFloatingButton: controller.onPressedFloatingButton,
        );
      },
    );
  }
}
