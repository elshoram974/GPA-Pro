import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/functions/my_bottom_sheets.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsPrivacyButton extends StatelessWidget {
  const ContactUsPrivacyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaleFactor: MediaQuery.textScaleFactorOf(context),
      text: TextSpan(
        text: "${AppConstLang.orFrom.tr} ",
        style: Theme.of(context).textTheme.bodyMedium!,
        children: [
          TextSpan(
            text: AppConstLang.here.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.textButton(),
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = AppBottomSheets.contactUs,
          )
        ],
      ),
    );
  }
}
