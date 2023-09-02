import 'package:gpa_pro/controller/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenControllerImp>(
      builder: (controller) {
        return controller.homePages[controller.index].body;
      },
    );
  }
}
