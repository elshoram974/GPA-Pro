import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/account_settings_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';
import 'package:gpa_pro/view/widgets/user/settings/photo/photo_settings.dart';
import 'package:gpa_pro/view/widgets/user/user_list_tile.dart';

class AccountSettings extends GetView<AccountSettingControllerImp> {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenStructure(
      title: AppConstLang.accountSettings.tr,
      body: Column(
        children: [
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
          const PhotoSettings(),
          const SizedBox(height: AppConstant.kDefaultPadding),
          UserListTile(
            title: AppConstLang.changeName.tr,
            onTap: controller.changeName,
          ),
          UserListTile(
            title: AppConstLang.changePass.tr,
            onTap: controller.changePass,
          ),
          UserListTile(
            title: AppConstLang.deleteAccount.tr,
            onTap: controller.deleteAccount,
          ),
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
        ],
      ),
    );
  }
}
