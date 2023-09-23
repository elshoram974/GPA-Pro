import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/change_pass_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/pass_field_controller.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';

class ChangePasswordScreen extends GetView<ChangePassControllerImp> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getUser(Get.arguments['user']);
    double screenHeight = MediaQuery.sizeOf(context).height;
    return AuthScreenStructure(
      title: AppConstLang.changePass.tr,
      onWillPop: controller.onWillPop,
      body: Form(
        key: controller.key,
        child: Column(
          children: [
            SizedBox(height: 0.1 * screenHeight),
            Text(
              controller.user.email.toLowerCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: AppConstant.kDefaultPadding),
            DefaultPassWidget(
              minChar: 8,
              textInputAction: TextInputAction.next,
              onChanged: (val) => controller.password = val,
            ),
            DefaultPassWidget(
              isRePass: true,
              newValid: true,
              onFieldSubmitted: (val) => controller.onSave(),
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return AppConstLang.fillField.tr;
                } else if (value != controller.password) {
                  return AppConstLang.notSamePass.tr;
                }
                return null;
              },
            ),
            SizedBox(height: 0.1 * screenHeight),
            ElevatedButton(
              onPressed: controller.onSave,
              child: Text(AppConstLang.saveChanges.tr),
            ),
            const SizedBox(height: 2 * AppConstant.kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
