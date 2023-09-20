import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/auth/signup_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';

class SignUpPasswords extends StatelessWidget {
  const SignUpPasswords({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpControllerImp>(
      builder: (controller) {
        return Column(
          children: [
            MyDefaultField(
              textDirection: TextDirection.ltr,
              // borderColor: AppColor.secondary,
              textColor: Colors.black,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.none,
              labelText: AppConstLang.password.tr,
              onChanged: (val) => controller.password = val,
              validator: (value) => AppValidator.validInputAuth(
                  value, 8, 100, AuthValidType.password),
              obscureText: controller.showPass,
              suffix: IconButton(
                onPressed: controller.changeShowPassword,
                icon: Icon(
                  controller.showPass
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
            MyDefaultField(
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.done,
              // borderColor: AppColor.secondary,
              textColor: Colors.black,
              textCapitalization: TextCapitalization.none,
              textAlign: TextAlign.left,
              labelText: AppConstLang.rePassword.tr,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return AppConstLang.fillField.tr;
                } else if (value != controller.password) {
                  return AppConstLang.notSamePass.tr;
                }
                return null;
              },
              obscureText: controller.showRePass,
              onFieldSubmitted: (val) => controller.onSignUp(),
              suffix: IconButton(
                onPressed: () => controller.changeShowPassword(isRePass: true),
                icon: Icon(
                  controller.showRePass
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
