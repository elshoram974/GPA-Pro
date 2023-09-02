import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReplacementSearchWidget extends StatelessWidget {
  const ReplacementSearchWidget(this.replacement, {super.key});

  final String replacement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.width / 2.3),
      child: Text(
        replacement,
        style: context.textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}