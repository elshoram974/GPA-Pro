import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetSettingsButton extends StatelessWidget {
  const ResetSettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: AppConstLang.resetSettings.tr,
      subtitle: AppConstLang.pressToResetSettings.tr,
      leadingIcon: Icons.warning_amber_outlined,
      onTap: () {
        bool isThemeChanged = AppInjections.themeMode.isInfoChanged;
        bool isLangChanged = AppInjections.locale.isInfoChanged;

        if (isThemeChanged || isLangChanged) {
          CustomDialog.warningDialog(
            "${AppConstLang.areUSureUWanna.tr} ${AppConstLang.resetAllSettings.tr}!",
            onConfirm: () {
              AppInjections.themeMode.deleteSavedMode();
              AppInjections.locale.deleteSavedLang();
            },
          );
        } else {
          CustomDialog.warningDialog(
              "${AppConstLang.settingsHaveNotBeenChangedToReset.tr}!");
        }
      },
    );
  }
}
