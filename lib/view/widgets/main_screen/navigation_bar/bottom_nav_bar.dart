import 'package:gpa_pro/controller/main_screen_controller.dart';
import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/class/body_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.sizeOf(context).width <= AppDimension.maxPhone,
      child: GetBuilder<MainScreenControllerImp>(
        builder: (controller) {
          return BottomNavigationBar(
            showUnselectedLabels: false,
            // selectedIconTheme: const IconThemeData(size: 28),
            currentIndex: controller.index,
            onTap: controller.changeBody,
            items: [
              for (Body e in AppInjections.mainScreenImp.homePages)
                BottomNavigationBarItem(
                  icon: Icon(e.icon),
                  label: e.label,
                  tooltip: e.label,
                ),
            ],
          );
        },
      ),
    );
  }
}
