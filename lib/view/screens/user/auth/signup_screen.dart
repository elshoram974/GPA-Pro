import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/signup_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/user/auth/sign_up/agreed_list_tile.dart';
import 'package:gpa_pro/view/widgets/user/auth/sign_up/signup_email.dart';
import 'package:gpa_pro/view/widgets/user/auth/sign_up/signup_name.dart';
import 'package:gpa_pro/view/widgets/user/auth/sign_up/signup_passwords.dart';

class SignUpScreen extends GetView<SignUpControllerImp> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return AuthScreenStructure(
      title: AppConstLang.signUp.tr,
      onWillPop: controller.onWillPop,
      body: Form(
        key: controller.key,
        child: AutofillGroup(
          child: Column(
            children: [
              SizedBox(height: 0.1 * screenHeight),
              const SignUpName(),
              const SignUpEmail(),
              const SignUpPasswords(),
              const AgreedListTileWidget(),
              SizedBox(height: 0.1 * screenHeight),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.onSignUp,
                  child: Text(AppConstLang.signUp.tr),
                ),
              ),
              const SizedBox(height: 2 * AppConstant.kDefaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}