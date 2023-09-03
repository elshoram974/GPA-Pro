import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLabels extends StatelessWidget {
  const MyLabels(this.label, {super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(top: AppConstant.kDefaultPadding),
      width: double.infinity,
      child: Text(label, style: context.textTheme.bodySmall),
    );
  }
}
