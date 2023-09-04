import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/auth/login_controller.dart';
import 'package:gpa_pro/core/constants/assets.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/auth_title.dart';
import 'package:gpa_pro/view/widgets/auth/login/login_buttons_widget.dart';
import 'package:gpa_pro/view/widgets/auth/login/login_fields.dart';

class LoginScreen extends GetView<LoginControllerImp> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return AuthScreenStructure(
      onWillPop: controller.onWillPop,
      body: ListView(
        children: [
          AuthTitle(AppConstLang.login.tr),
          const Hero(
            tag: AppAssets.splashIcon,
            child: Image(image: AssetImage(AppAssets.splashIcon), height: 250),
          ),
          SizedBox(height: 0.01 * screenHeight),
          const LoginFields(),
          SizedBox(height: 0.01 * screenHeight),
          const LoginButtons(),
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
        ],
      ),
    );
  }
}
