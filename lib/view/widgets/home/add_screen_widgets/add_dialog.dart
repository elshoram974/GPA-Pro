import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/functions/responsive_width.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_buttons.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/dialog_content/dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddedDialog extends StatelessWidget {
  const AddedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AddControllerImp addControl = Get.find<AddControllerImp>();
    Get.lazyPut<DialogControllerImp>(() => DialogControllerImp());


    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      elevation: 0,
      shadowColor: Colors.transparent,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: SizedBox(
          width: makeWidth(context, double.infinity, 500, 900),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dialog(
                insetPadding: EdgeInsets.zero,
                clipBehavior: Clip.hardEdge,
                alignment: Alignment.center,
                child: ListView(
                  padding: const EdgeInsets.all(15),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Text(
                      addControl.subjectModel == null
                          ? AppConstLang.add.tr
                          : AppConstLang.edit.tr,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 30),
                    const DialogContent(),
                  ],
                ),
              ),
              const DialogButtons()
            ],
          ),
        ),
      ),
    );
  }
}
