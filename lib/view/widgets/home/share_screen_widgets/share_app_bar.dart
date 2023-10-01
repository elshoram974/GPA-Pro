import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/saved_subjects_controllers/share_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/my_app_bar.dart';

class ShareAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShareAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareSubjectsControllerImp>(
      builder: (controller) {
        return MyAppBar(
          title: AppConstLang.share.tr,
          pageType: PageType.shareScreen,
          isAllSelected: controller.isAllSelected,
          isSelected: controller.isSelected,
          remove: controller.removeSharedSubject,
          selectAllOrDeselect: controller.selectAllOrDeselect,
          selectedLength: controller.selectedLength,
          selectedSubjects: controller.selectedList,
          moreActions: [
            IconButton(
                onPressed: controller.linkButton,
                icon: const Icon(Icons.link_outlined))
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
