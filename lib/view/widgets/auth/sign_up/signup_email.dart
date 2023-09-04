import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/auth/signup_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';

class SignUpEmail extends StatelessWidget {
  const SignUpEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDefaultField(
      filled: true,
      textCapitalization: TextCapitalization.none,
      labelText: AppConstLang.email.tr,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.emailAddress,
      onChanged: (val) =>
          Get.find<SignUpControllerImp>().email = val.toLowerCase(),
      validator: (value) =>
          AppValidator.validInputAuth(value, 0, 100, AuthValidType.email),
    );
  }
}
