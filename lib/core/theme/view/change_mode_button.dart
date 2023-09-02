import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mode_controller.dart';
import 'change_mode_screen.dart';

class ChangeModeButton extends StatelessWidget {
  const ChangeModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModeController>(
        builder: (_) => CustomListTile(
              title: AppConstLang.changeMode.tr,
              subtitle: "${AppConstLang.pressToChange.tr} ${_.currentMode.tr}",
              leadingIcon: Icons.brightness_medium_outlined,
              onTap: () => Get.to(() => const ChangeModeScreen()),
            ));
  }
}
