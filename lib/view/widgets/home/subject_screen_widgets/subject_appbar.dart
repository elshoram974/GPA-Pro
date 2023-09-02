import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SubjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubjectControllerImp>(
      builder: (controller) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: GPAFunctionsHelper([controller.editedSubject])
              .color(context, inList: false),
          child: AppBar(
            title: Text(controller.editedSubject.name),
            forceMaterialTransparency: true,
            actions: [
              IconButton(
                tooltip: AppConstLang.save.tr,
                onPressed: controller.onSave,
                icon: const Icon(Icons.save_outlined),
              ),
              const SizedBox(width: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
