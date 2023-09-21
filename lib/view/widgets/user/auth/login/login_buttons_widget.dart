import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/forget_password_controller.dart';
import 'package:gpa_pro/controller/user/auth/login_controller.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';

class LoginButtons extends GetView<LoginControllerImp> {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        TextButton(
          onPressed: () {
            Get.lazyPut(() => ForgotPasswordControllerImp());
            Get.toNamed(AppRoute.forgotPassScreen);
          },
          child: Text(AppConstLang.forgotPassword.tr),
        ),
        SizedBox(height: 0.1 * screenHeight),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.login,
            child: Text(AppConstLang.login.tr),
          ),
        ),
      ],
    );
  }
}
