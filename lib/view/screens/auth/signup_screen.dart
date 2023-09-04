import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/auth/signup_controller.dart';
import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/auth_title.dart';
import 'package:gpa_pro/view/widgets/auth/sign_up/signup_email.dart';
import 'package:gpa_pro/view/widgets/auth/sign_up/signup_name.dart';
import 'package:gpa_pro/view/widgets/auth/sign_up/signup_passwords.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) => AuthScreenStructure(
        onWillPop: controller.onWillPop,
        body: Form(
          key: controller.key,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: AppDimension.maxPhone.toDouble(),
            ),
            child: ListView(
              children: [
                AuthTitle(AppConstLang.signUp.tr),
                const SizedBox(height: 3 * AppConstant.kDefaultPadding),
                const SignUpName(),
                const SignUpEmail(),
                const SignUpPasswords(),
                const SizedBox(height: 4 * AppConstant.kDefaultPadding),
                ElevatedButton(
                  onPressed: controller.onSignUp,
                  child: Text(AppConstLang.signUp.tr),
                ),
                const SizedBox(height: 2 * AppConstant.kDefaultPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
