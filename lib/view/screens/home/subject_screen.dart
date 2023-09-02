import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_appbar.dart';
import 'package:gpa_pro/view/widgets/home/subject_screen_widgets/subject_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageArgument argument;
    argument = ModalRoute.of(context)?.settings.arguments as PageArgument;

    return GetBuilder<SubjectControllerImp>(
      builder: (controller) {
        controller.getArguments(argument);
        return WillPopScope(
          onWillPop: controller.onWillPop,
          child: const Scaffold(
            appBar: SubjectAppBar(),
            body: SubjectBody(),
          ),
        );
      },
    );
  }
}
