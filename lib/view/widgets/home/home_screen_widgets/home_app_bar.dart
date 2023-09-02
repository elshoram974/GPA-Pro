import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return MyAppBar(
          title: AppConstLang.home.tr,
          isAllSelected: controller.isAllSelected,
          isSelected: controller.isSelected,
          remove: controller.remove,
          selectAllOrDeselect: controller.selectAllOrDeselect,
          selectedLength: controller.selectedLength,
          selectedSubjects: controller.selectedSubjects,
          pageType: PageType.homeScreen,
          changeSelectedCalc: controller.changeSelectedCalc,
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
