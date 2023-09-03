import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/auth_title.dart';

class CheckCodeScreen extends StatelessWidget {
  const CheckCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenStructure(
      body: ListView(
        children: [
          AuthTitle(AppConstLang.verifyCode.tr),
          MyDefaultField(
            filled: true,
            labelText: AppConstLang.verifyCode.tr,
          ),
          const SizedBox(height: 6 * AppConstant.kDefaultPadding),
          ElevatedButton(
            onPressed: () {
              AppSnackBar.messageSnack("Right code");
              print("Right code");
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text(AppConstLang.confirm.tr),
          )
        ],
      ),
    );
  }
}
