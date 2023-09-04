import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/auth/check_code_controller.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';

class VerifyCodeField extends GetView<CheckCodeControllerImp> {
  const VerifyCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDefaultField(
      fieldKey: controller.key,
      borderColor: AppColor.secondary,
      isDouble: true,
      labelText: AppConstLang.verifyCode.tr,
      onSaved: (val) => controller.code = val,
      onFieldSubmitted: (val) => controller.onConfirm(),
      validator: (val) => AppValidator.validInputAuth(val, 6, 6, AuthValidType.int),
    );
  }
}
