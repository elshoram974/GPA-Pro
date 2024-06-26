import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';

class ShowAsyncInCard extends StatelessWidget {
  const ShowAsyncInCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: AppColor.tableColor(context).withOpacity(0.3)),
        Text(
          AppConstLang.needToSync.tr,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
