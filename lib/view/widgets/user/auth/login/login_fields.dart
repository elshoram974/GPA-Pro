import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/login_controller.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/core/shared/custom_fields/pass_field_controller.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(
      builder: (controller) {
        return Form(
          key: controller.key,
          child: AutofillGroup(
            child: Column(
              children: [
                MyDefaultField(
                  textDirection: TextDirection.ltr,
                  textColor: Colors.black,
                  textAlign: TextAlign.left,
                  autofillHints: const [AutofillHints.email,AutofillHints.username],
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  labelText: AppConstLang.email.tr,
                  onChanged: (val) => controller.email = val,
                  validator: (value) => AppValidator.validInputAuth(
                    value,
                    8,
                    100,
                    AuthValidType.email,
                  ),
                ),
                DefaultPassWidget(
                  onChanged: (val) => controller.password = val,
                  onFieldSubmitted: (val) => controller.login(),
                  onEditingComplete: TextInput.finishAutofillContext,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
