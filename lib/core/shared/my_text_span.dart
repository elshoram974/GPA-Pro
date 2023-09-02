import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextSpan extends StatelessWidget {
  final String boldText;
  final String defaultText;
  final double? fontSize;
  final TextStyle? boldStyle;
  final TextStyle? styleToDefault;
  final TextAlign textAlign;
  final double textScaleFactor;
  final void Function()? onTap;

  const MyTextSpan(
    this.boldText,
    this.defaultText, {
    super.key,
    this.fontSize,
    this.boldStyle,
    this.styleToDefault,
    this.textAlign = TextAlign.start,
    this.textScaleFactor = 1.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap == null) {
      return SelectableText.rich(
        _customText(context),
        textScaleFactor: textScaleFactor,
        textAlign: textAlign,
      );
    } else {
      return RichText(
        textScaleFactor: textScaleFactor,
        textAlign: textAlign,
        text: _customText(context),
      );
    }
  }

  TextSpan _customText(BuildContext context) {
    return TextSpan(
      text: "$boldText ",
      style: boldStyle ??
          context.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
      children: [
        TextSpan(
          text: defaultText,
          style: styleToDefault ?? context.textTheme.bodyMedium!,
        ),
      ],
    );
  }
}
