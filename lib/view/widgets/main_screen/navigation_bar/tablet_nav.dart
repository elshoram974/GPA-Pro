import 'package:gpa_pro/controller/main_screen_controller.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/class/body_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyNavigationRail extends StatelessWidget {
  const MyNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenControllerImp>(
      init: MainScreenControllerImp(),
      builder: (controller) {
        return NavigationRail(
          onDestinationSelected: controller.changeBody,
          selectedIndex: controller.index,
          elevation: 5,
          backgroundColor:
              context.theme.scaffoldBackgroundColor.withOpacity(0.9),
          useIndicator: true,
          destinations: [
            for (Body e in AppInjections.mainScreenImp.homePages)
              NavigationRailDestination(
                icon: Icon(e.icon),
                label: Text(e.label),
              ),
          ],
        );
      },
    );
  }
}
