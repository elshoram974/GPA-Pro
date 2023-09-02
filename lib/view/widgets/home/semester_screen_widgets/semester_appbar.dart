import 'package:gpa_pro/controller/home/semester_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SemesterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SemesterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SemesterControllerImp>(
      builder: (controller) {
        return MyAppBar(
          title: controller.thisSemester.name.tr,
          pageType: PageType.semesterScreen,
          isAllSelected: controller.isAllSelected,
          isSelected: controller.isSelected,
          remove: controller.remove,
          selectAllOrDeselect: controller.selectAllOrDeselect,
          selectedLength: controller.selectedLength,
          changeSelectedCalc: controller.changeSelectedCalc,
          selectedSubjects: controller.selectedList,
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
