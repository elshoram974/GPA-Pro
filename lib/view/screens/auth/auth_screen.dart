import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/assets.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/login_signup_buttons.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return AuthScreenStructure(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppConstant.kDefaultPadding),
            const Hero(
              tag: AppAssets.splashIcon,
              child: Image(image: AssetImage(AppAssets.splashIcon)),
            ),
            SizedBox(height: 0.1 * size.height),
            const LoginAndSignUpButtons(),
          ],
        ),
      ),
    );
  }
}
