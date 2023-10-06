import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/signup_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/pass_field_controller.dart';

class SignUpPasswords extends StatelessWidget {
  const SignUpPasswords({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) {
        return Column(
          children: [
            DefaultPassWidget(
              minChar: 8,
              textInputAction: TextInputAction.next,
              onChanged: (val) => controller.password = val,
            ),
            DefaultPassWidget(
              isRePass: true,
              newValid: true,
              onFieldSubmitted: (val) => controller.onSignUp(),
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return AppConstLang.fillField.tr;
                } else if (value != controller.password) {
                  return AppConstLang.notSamePass.tr;
                }
                return null;
              },
              onEditingComplete: TextInput.finishAutofillContext,
            ),
          ],
        );
      },
    );
  }
}
