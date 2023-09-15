import 'package:gpa_pro/controller/saved_subjects_controllers/upload_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UploadAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadSavedTxtFileImp>(
      builder: (__) {
        return MyAppBar(
          title: __.argument.title,
          pageType: PageType.addScreen,
          isAllSelected: __.isAllSelected,
          isSelected: __.isSelected,
          selectAllOrDeselect: __.selectAllOrDeselect,
          remove: __.removeUploadedSubject,
          selectedLength: __.selectedLength,
          changeSelectedCalc: __.changeSelectedCalc,
          selectedSubjects: const [],
          moreActions: [
            IconButton(
              tooltip: AppConstLang.save.tr,
              onPressed: __.subjectsList.isEmpty ? null : __.onSave,
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
