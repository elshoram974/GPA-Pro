import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/user/settings/photo/photo_settings.dart';
import 'package:gpa_pro/view/widgets/user/user_list_tile.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenStructure(
      title: AppConstLang.accountSettings.tr,
      body: ListView(
        children: [
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
          const PhotoSettings(),
          const SizedBox(height: AppConstant.kDefaultPadding),
          UserListTile(
            title: "change name".tr,
            subtitle: "you can change name",
          ),
          UserListTile(
            title: "change pass",
            subtitle: "you can change pass",
          ),
          UserListTile(
            title: "Delete account",
            subtitle: "you can delete account",
          ),
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
        ],
      ),
    );
  }
}
