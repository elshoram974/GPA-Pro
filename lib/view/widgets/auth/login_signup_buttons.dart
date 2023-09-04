import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/auth/login_controller.dart';
import 'package:gpa_pro/controller/auth/signup_controller.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';

class LoginAndSignUpButtons extends StatelessWidget {
  const LoginAndSignUpButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5 * AppConstant.kDefaultPadding,
        vertical: 2 * AppConstant.kDefaultPadding,
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColor.selectedColor(context),
            ),
            onPressed: () {
              Get.lazyPut<LoginControllerImp>(() => LoginControllerImp());
              Get.toNamed(AppRoute.loginScreen);
            },
            child: Text(AppConstLang.login.tr),
          ),
          const SizedBox(height: AppConstant.kDefaultPadding),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColor.selectedColor(context).withBlue(255),
            ),
            onPressed: () {
              Get.lazyPut<SignUpControllerImp>(() => SignUpControllerImp());
              Get.toNamed(AppRoute.signUpScreen);
            },
            child: Text(AppConstLang.signUp.tr),
          ),
        ],
      ),
    );
  }
}
