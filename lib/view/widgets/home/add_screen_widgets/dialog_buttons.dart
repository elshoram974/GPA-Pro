import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogButtons extends StatelessWidget {
  const DialogButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DialogControllerImp _ = Get.find<DialogControllerImp>();
    AddControllerImp addControl = Get.find<AddControllerImp>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 5),
              onPressed: _.onAdd,
              child: Text(
                addControl.subjectModel == null
                    ? AppConstLang.add.tr
                    : AppConstLang.edit.tr,
              ),
            ),
          ),
          const Spacer(flex: 4),
          Expanded(
            flex: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 5),
              onPressed: () => {Get.back() /**, _.disposeControllers() */},
              child: Text(AppConstLang.cancel.tr),
            ),
          ),
        ],
      ),
    );
  }
}
