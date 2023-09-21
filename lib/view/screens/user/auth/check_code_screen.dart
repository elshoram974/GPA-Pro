import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/check_code_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/user/auth/verify_code/re_send_verify_code.dart';
import 'package:gpa_pro/view/widgets/user/auth/verify_code/verify_code_field_widget.dart';

class CheckCodeScreen extends GetView<CheckCodeControllerImp> {
  const CheckCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CheckCodeControllerImp>(() => CheckCodeControllerImp());
    return AuthScreenStructure(
      title: AppConstLang.verifyCode.tr,
      onWillPop: controller.onWillPop,
      body: ListView(
        children: [
          SizedBox(height: 0.25 * MediaQuery.sizeOf(context).height),
          Text(
            controller.email.toLowerCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          ),
          const VerifyCodeField(),
          const ReSendVerifyCode(),
          const SizedBox(height: 3 * AppConstant.kDefaultPadding),
          ElevatedButton(
            onPressed: controller.onConfirm,
            child: Text(AppConstLang.confirm.tr),
          ),
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
        ],
      ),
    );
  }
}
