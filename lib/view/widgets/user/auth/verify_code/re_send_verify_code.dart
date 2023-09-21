import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/check_code_controller.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';

class ReSendVerifyCode extends StatelessWidget {
  const ReSendVerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckCodeControllerImp>(
      builder: (controller) {
        return Column(
          children: [
            TextButton(
              onPressed: controller.canReSend ? controller.resendCode : null,
              child: Text(AppConstLang.sendAnotherCode.tr),
            ),
            Visibility(
              visible: !controller.canReSend,
              child: Text(
                "${AppConstLang.toResendPleaseWait.tr} ${controller.secondsRemaining} ${AppConstLang.seconds.tr}",
                style: TextStyle(color: AppColor.secondary),
              ),
            ),
          ],
        );
      },
    );
  }
}
