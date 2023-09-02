import 'package:flutter/material.dart';

class PrivacyPieceTextSpan extends StatelessWidget {
  final String boldText;
  final String defaultText;
  final TextAlign textAlign;
  final InlineSpan? addInEnd;

  const PrivacyPieceTextSpan(
    this.boldText,
    this.defaultText, {
    super.key,
    this.textAlign = TextAlign.start,
    this.addInEnd,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: boldText,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        children: [
          TextSpan(
            text: '\n\n$defaultText  ',
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          if (addInEnd != null) addInEnd!,
        ],
      ),
      textScaleFactor: MediaQuery.textScaleFactorOf(context),
      textAlign: textAlign,
    );
  }
}
