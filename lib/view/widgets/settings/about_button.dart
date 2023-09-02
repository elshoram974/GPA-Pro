import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        const Divider(),
        CustomListTile(
          title: AppConstLang.aboutApp.tr,
          leadingIcon: Icons.help_outline,
          onTap: () => Get.toNamed(AppRoute.aboutApp),
        ),
      ],
    );
  }
}
