import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/auth_title.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenStructure(
      body: ListView(
        children: [
          AuthTitle(AppConstLang.signUp.tr),
          const SizedBox(height: 3 * AppConstant.kDefaultPadding),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: MyDefaultField(
                  filled: true,
                  labelText: AppConstLang.firstName.tr ,
                ),
              ),
              Expanded(
                child: MyDefaultField(
                  filled: true,
                  labelText: AppConstLang.lastName.tr,
                ),
              ),
            ],
          ),
         MyDefaultField(
            filled: true,
            labelText: AppConstLang.email.tr,
          ),
          MyDefaultField(
            filled: true,
            labelText: AppConstLang.password.tr,
            suffix: IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_red_eye_outlined),
            ),
          ),
          MyDefaultField(
            filled: true,
            labelText: AppConstLang.rePassword.tr ,
            suffix: IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_red_eye_outlined),
            ),
          ),
          const SizedBox(height: 4 * AppConstant.kDefaultPadding),
          ElevatedButton(onPressed: () {
            Get.toNamed(AppRoute.checkCodeScreen);
          }, child: Text(AppConstLang.signUp.tr))
        ],
      ),
    );
  }
}
