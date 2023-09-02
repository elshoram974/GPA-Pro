import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/my_bottom_sheets.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ByMREWidget extends StatelessWidget {
  const ByMREWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4 * AppConstant.kDefaultPadding),
      child: Text.rich(
        textAlign: TextAlign.center,
        style: context.textTheme.labelLarge,
        TextSpan(
          text: "${AppConstLang.by.tr} ",
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = AppBottomSheets.contactUs,
              style: TextStyle(
                color: AppColor.textButton(),
                fontWeight: FontWeight.bold,
              ),
              text: "M.R.E",
            ),
          ],
        ),
      ),
    );
  }
}
