import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/assets.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/user/auth/login_signup_buttons.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return AuthScreenStructure(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Hero(
              tag: AppAssets.splashIcon,
              child: Image(
                image: const AssetImage(AppAssets.splashIcon),
                height: 0.5 * size.height,
              ),
            ),
            SizedBox(height: 0.1 * size.height),
            const LoginAndSignUpButtons(),
          ],
        ),
      ),
    );
  }
}
