import 'package:gpa_pro/core/constants/app_info.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppVersionWidget extends StatelessWidget {
  const AppVersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      noFunction: true,
      miniIcon: true,
      title: AppConstLang.appVersion.tr,
      subtitle: AppInfo.appVersion,
      leadingIcon: Icons.radio_button_unchecked_outlined,
    );
  }
}
