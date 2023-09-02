import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyList extends StatelessWidget {
  final bool isEmpty;
  const EmptyList({super.key, required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isEmpty,
      child: Container(
        alignment: Alignment.center,
        height: Get.height * 0.5,
        child: Text(
          "${AppConstLang.add.tr} ${AppConstLang.subject.tr}",
          style: context.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
