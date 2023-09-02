import 'package:gpa_pro/core/functions/rate_app.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewAppButton extends StatelessWidget {
  const ReviewAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: AppConstLang.reviewApp.tr,
      miniIcon: true,
      subtitle: "${AppConstLang.pressHereTo.tr} ${AppConstLang.reviewApp.tr}",
      leadingIcon: Icons.radio_button_unchecked_outlined,
      onTap: RateApp.reviewApp,
    );
  }
}
