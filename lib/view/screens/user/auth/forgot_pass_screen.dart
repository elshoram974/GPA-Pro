import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/forget_password_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';

class ForgotPassScreen extends GetView<ForgotPasswordControllerImp> {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenStructure(
      title: AppConstLang.forgotPassword.tr,
      onWillPop: controller.onWillPop,
      body: ListView(
        children: [
          SizedBox(height: 0.25 * MediaQuery.sizeOf(context).height),
          const ForgotPasswordField(),
          const SizedBox(height: 3 * AppConstant.kDefaultPadding),
          ElevatedButton(
            onPressed: controller.onConfirm,
            child: Text(AppConstLang.confirm.tr),
          ),
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
        ],
      ),
    );
  }
}

class ForgotPasswordField extends GetView<ForgotPasswordControllerImp> {
  const ForgotPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDefaultField(
      fieldKey: controller.key,
      // borderColor: AppColor.secondary,
      textColor: Colors.black,

      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.start,
      labelText: AppConstLang.email.tr,
      onChanged: (val) => controller.email = val,
      onFieldSubmitted: (val) => controller.onConfirm(),
      validator: (val) =>
          AppValidator.validInputAuth(val, 6, 100, AuthValidType.email),
    );
  }
}
