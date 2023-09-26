import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: AppConstLang.termsConditions.tr,
      miniIcon: true,
      subtitle:
          "${AppConstLang.pressHereToSee.tr} ${AppConstLang.termsConditions.tr}",
      leadingIcon: Icons.radio_button_unchecked_outlined,
      onTap: () => Get.toNamed(AppRoute.termsConditions),
    );
  }
}
