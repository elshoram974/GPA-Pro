import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/assets.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/auth_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenStructure(
      body: ListView(
        children: [
          AuthTitle(AppConstLang.login.tr),
          const Hero(
            tag: AppAssets.splashIcon,
            child: Image(image: AssetImage(AppAssets.splashIcon), height: 270),
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
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoute.forgotPassScreen);
            },
            child: Text(AppConstLang.forgotPassword.tr),
          ),
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
          ElevatedButton(
              onPressed: () {
                AppSnackBar.messageSnack("login");
                print("Login");
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text(AppConstLang.login.tr))
        ],
      ),
    );
  }
}
