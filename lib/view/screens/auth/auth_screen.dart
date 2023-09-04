import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/assets.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/login_signup_buttons.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthScreenStructure(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Spacer(),
          Hero(
            tag: AppAssets.splashIcon,
            child: Image(image: AssetImage(AppAssets.splashIcon)),
          ),
          Spacer(),
          LoginAndSignUpButtons(),
        ],
      ),
    );
  }
}
