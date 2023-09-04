import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/auth/signup_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';

class SignUpName extends StatelessWidget {
  const SignUpName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: MyDefaultField(
            filled: true,
            textAlign: TextAlign.start,
            labelText: AppConstLang.firstName.tr,
            onChanged: (val) => Get.find<SignUpControllerImp>().firstName = val,
            validator: (value) =>
                AppValidator.validInputAuth(value, 3, 20, AuthValidType.name),
          ),
        ),
        Expanded(
          child: MyDefaultField(
            filled: true,
            textAlign: TextAlign.start,
            labelText: AppConstLang.lastName.tr,
            onChanged: (val) => Get.find<SignUpControllerImp>().lastName = val,
            validator: (value) =>
                AppValidator.validInputAuth(value, 3, 20, AuthValidType.name),
          ),
        ),
      ],
    );
  }
}
