import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/default_body.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/add_appbar.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/add_body/add_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddArgument argument;
    argument = ModalRoute.of(context)?.settings.arguments as AddArgument;

    return GetBuilder<AddControllerImp>(
      builder: (controller) {
        controller.getArguments(argument);
        return DefaultBody(
          onWillPop: controller.onWillPop,
          appBar: const AddAppBar(),
          body: const AddBody(),
          addIsAvailable: true,
          pageType: PageType.addScreen,
          tooltipFloatingButton: AppConstLang.addSubject.tr,
          onPressedFloatingButton: controller.addSubject,
          modelList: controller.subjectsList,
          allSubjects: controller.allSubjects(),
        );
      },
    );
  }
}
