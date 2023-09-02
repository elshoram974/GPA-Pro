import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/contact_us/contact_constants.dart';
import 'package:gpa_pro/core/contact_us/contact_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan dashLine(BuildContext context, String defaultText, [String? link]) {
  return TextSpan(
    style: Theme.of(context).textTheme.bodyMedium!,
    text: '\n  - ',
    children: [
      TextSpan(
        text: defaultText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: link == null ? null : AppColor.textButton(),
            ),
        recognizer: TapGestureRecognizer()
          ..onTap = link == null
              ? null
              : () {
                  LaunchHelper.lunchApp(
                    contactWay: Launch.other,
                    otherLink: link,
                  );
                },
      ),
    ],
  );
}
