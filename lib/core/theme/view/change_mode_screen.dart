import 'package:gpa_pro/core/constants/public_constant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../keys.dart';
import '../controller/mode_controller.dart';

class ChangeModeScreen extends StatelessWidget {
  const ChangeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(title: Text("change_mode".tr)),
        body: GetBuilder<ModeController>(
          builder: (controller) => ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstant.kDefaultPadding,
              vertical: 2 * AppConstant.kDefaultPadding,
            ),
            itemCount: Keys.myKey().keys.length,
            itemBuilder: (context, index) {
              return RadioListTile<String>(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstant.kDefaultRadius),
                ),
                value: Keys.myKey().keys.toList()[index],
                groupValue: controller.currentMode,
                onChanged: controller.changeThemeMode,
                title: Text(Keys.myKey().keys.toList()[index].tr),
              );
            },
          ),
        ),
      ),
    );
  }
}
