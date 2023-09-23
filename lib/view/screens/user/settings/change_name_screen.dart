import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/change_name_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';

class ChangeNameScreen extends GetView<ChangeNameControllerImp> {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return AuthScreenStructure(
      title: AppConstLang.changeName.tr,
      onWillPop: controller.onWillPop,
      body: Form(
        key: controller.key,
        child: Column(
          children: [
            SizedBox(height: 0.1 * screenHeight),
            Text(
              controller.user.completeName,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              controller.user.email.toLowerCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: AppConstant.kDefaultPadding),
            MyDefaultField(
              textColor: Colors.black,
              textAlign: TextAlign.start,
              labelText: AppConstLang.firstName.tr,
              onChanged: (val) => controller.firstName = val.trim(),
              validator: (value) =>
                  AppValidator.validInputAuth(value, 3, 20, AuthValidType.name),
            ),
            MyDefaultField(
              // borderColor: AppColor.secondary,
              textColor: Colors.black,
              textAlign: TextAlign.start,
              labelText: AppConstLang.lastName.tr,
              onChanged: (val) => controller.lastName = val.trim(),
              validator: (value) =>
                  AppValidator.validInputAuth(value, 3, 20, AuthValidType.name),
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
