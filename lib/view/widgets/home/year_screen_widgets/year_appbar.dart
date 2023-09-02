import 'package:gpa_pro/controller/home/year_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YearAppBar extends StatelessWidget implements PreferredSizeWidget {
  const YearAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YearControllerImp>(
      builder: (controller) {
        return MyAppBar(
          title: controller.thisYear.name.tr,
          pageType: PageType.yearScreen,
          isAllSelected: controller.isAllSelected,
          isSelected: controller.isSelected,
          remove: controller.remove,
          selectAllOrDeselect: controller.selectAllOrDeselect,
          selectedLength: controller.selectedLength,
          changeSelectedCalc: controller.changeSelectedCalc,
          selectedSubjects: controller.selectedSubjects,
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
