import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/check_code_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';

class VerifyCodeField extends GetView<CheckCodeControllerImp> {
  const VerifyCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDefaultField(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      textInputAction: TextInputAction.done,
      fieldKey: controller.key,
      // borderColor: AppColor.secondary,
      textColor: Colors.black,
      isDouble: true,
      labelText: AppConstLang.verifyCode.tr,
      onSaved: (val) => controller.code = val,
      onFieldSubmitted: (val) => controller.onConfirm(),
      validator: (val) =>
          AppValidator.validInputAuth(val, 6, 6, AuthValidType.int),
    );
  }
}
