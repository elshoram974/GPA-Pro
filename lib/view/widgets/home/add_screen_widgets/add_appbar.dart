import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddControllerImp>(
      builder: (controller) {
        return MyAppBar(
          title: controller.argument.title,
          pageType: PageType.addScreen,
          isAllSelected: controller.isAllSelected,
          isSelected: controller.isSelected,
          selectAllOrDeselect: controller.selectAllOrDeselect,
          remove: controller.removeAddedSubject,
          selectedLength: controller.selectedLength,
          changeSelectedCalc: controller.changeSelectedCalc,
          selectedSubjects: const [],
          moreActions: [
            IconButton(
              tooltip: AppConstLang.save.tr,
              onPressed: controller.onSave,
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
