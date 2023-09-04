import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/auth/check_code_controller.dart';
import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/data/datasource/remote/auth/verify_code.dart';
import 'package:gpa_pro/view/widgets/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/auth/auth_title.dart';

class CheckCodeScreen extends StatelessWidget {
  const CheckCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => null);
    return GetBuilder<CheckCodeControllerImp>(
      init: CheckCodeControllerImp(),
      builder: (controller) {
        return AuthScreenStructure(
          onWillPop: controller.onWillPop,
          body: Container(
            constraints:
                BoxConstraints(maxWidth: AppDimension.maxPhone.toDouble()),
            child: ListView(
              children: [
                AuthTitle(AppConstLang.verifyCode.tr),
                const SizedBox(height: 6 * AppConstant.kDefaultPadding),
                MyDefaultField(
                  fieldKey: controller.key,
                  filled: true,
                  isDouble: true,
                  labelText: AppConstLang.verifyCode.tr,
                  onSaved: (val)=> controller.code = val,
                  validator: (val)=> AppValidator.validInputAuth(val, 6, 6, AuthValidType.int),
                ),
                TextButton(
                  onPressed: ()=> VerifyCode.sendVerifyCode(controller.email),
                  child: Text(AppConstLang.sendCodeAgain.tr),
                ),
                const SizedBox(height: 3 * AppConstant.kDefaultPadding),
                ElevatedButton(
                  onPressed:controller.onConfirm,
                  child: Text(AppConstLang.confirm.tr),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
