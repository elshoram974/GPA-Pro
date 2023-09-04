import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/auth_title.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenStructure(
      body: ListView(
        children: [
          AuthTitle(AppConstLang.forgotPassword.tr),
          MyDefaultField(
            filled: true,
            labelText: AppConstLang.email.tr,
          ),
          const SizedBox(height: 6 * AppConstant.kDefaultPadding),
          ElevatedButton(
            onPressed: () {
              // Get.offNamed(
              //   AppRoute.checkCodeScreen,
              //   arguments: {"email": ''},
              // );
            },
            child: Text(AppConstLang.confirm.tr),
          )
        ],
      ),
    );
  }
}
