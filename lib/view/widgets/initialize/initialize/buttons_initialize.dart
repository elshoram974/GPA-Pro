import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitializeButton extends StatelessWidget {
  const InitializeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 50,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width < AppDimension.maxPhone
              ? double.infinity
              : 300,
          child: ElevatedButton(
            onPressed: AppInjections.initialize.editButton,
            child: Text(AppConstLang.edit.tr),
          ),
        ),
        TextButton(
          onPressed: AppInjections.initialize.resetButton,
          child: Text(AppConstLang.reset.tr),
        ),
      ],
    );
  }
}
