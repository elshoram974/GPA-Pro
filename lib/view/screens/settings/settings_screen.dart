import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/localization/view/change_lang_button.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/core/theme/view/change_mode_button.dart';
import 'package:gpa_pro/view/widgets/settings/about_button.dart';
import 'package:gpa_pro/view/widgets/settings/by_m_r_e.dart';
import 'package:gpa_pro/view/widgets/settings/reset_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/view/widgets/settings/auth/sign_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstLang.settings.tr)),
      body: const CustomBodyListView(
        children: [
          SignTile(),
          Divider(height: 3 * AppConstant.kDefaultPadding),
          ChangeModeButton(),
          ChangeLangButton(),
          ResetSettingsButton(),
          AboutButton(),
          ByMREWidget(),
        ],
      ),
    );
  }
}
