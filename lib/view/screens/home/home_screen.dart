import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/default_body.dart';
import 'package:gpa_pro/view/widgets/home/home_screen_widgets/home_app_bar.dart';
import 'package:gpa_pro/view/widgets/home/home_screen_widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return DefaultBody(
          onWillPop: controller.onWillPop,
          appBar: const HomeAppBar(),
          body: const HomeBody(),
          pageType: PageType.homeScreen,
          modelList: controller.yearsList,
          isEmptyBody: controller.yearsList.isEmpty,
          textWhenEmptyBody: AppConstLang.addYear.tr,
          realizedHours: controller.releaseHours,
          tooltipFloatingButton: AppConstLang.addYear.tr,
          addIsAvailable: controller.yearsList.length < 5,
          onPressedFloatingButton: controller.onPressedFloatingButton,
        );
      },
    );
  }
}
