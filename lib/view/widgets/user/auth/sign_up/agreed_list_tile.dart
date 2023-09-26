import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/auth/signup_controller.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';

class AgreedListTileWidget extends StatelessWidget {
  const AgreedListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder<SignUpControllerImp>(
          builder: (controller) {
            return Checkbox(
              activeColor: AppColor.primary,
              checkColor: Colors.white,
              value: controller.isAgreed,
              onChanged: controller.onAgreedChanged,
            );
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),
                children: [
                  TextSpan(text: "${AppConstLang.bySigningUpAgreeToOur.tr} "),
                  TextSpan(
                    text: AppConstLang.termsConditions.tr,
                    style: TextStyle(color: AppColor.textButton()),
                    recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(AppRoute.termsConditions),
                  ),
                  TextSpan(text: " ${AppConstLang.and.tr} "),
                  TextSpan(
                    text: AppConstLang.privacyPolicy.tr,
                    style: TextStyle(color: AppColor.textButton()),
                    recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(AppRoute.privacyPolicy),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
