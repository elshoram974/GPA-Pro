import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/change_name_controller.dart';
import 'package:gpa_pro/controller/user/settings/change_pass_controller.dart';
import 'package:gpa_pro/core/ads/class/rewarded_interstitial_ads.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/class/update_user.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/my_bottom_sheets.dart';
import 'package:gpa_pro/core/functions/photo_helper.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/widgets/user/settings/delete_account_widget.dart';
import 'package:image_picker/image_picker.dart';

enum EditPhoto { add, change, delete }

abstract class AccountSettingController extends GetxController {
  void changeName();
  void changePass();
  void deleteAccount();

  void onSelectInPopUpButton(EditPhoto item);
  Future<bool> pickImage(ImageSource source);
}

class AccountSettingControllerImp extends AccountSettingController {
  UserData? user;

  @override
  void onInit() {
    user = LoginRemotely.savedLogin();
    super.onInit();
  }

  @override
  void changeName() {
    CustomDialog.checkPassDialog(
      AppConstLang.toChangeName.tr,
      () {
        Get.lazyPut<ChangeNameControllerImp>(() => ChangeNameControllerImp());
        Get.toNamed(AppRoute.changeNameScreen);
      },
    );
  }

  @override
  void changePass() {
    CustomDialog.checkPassDialog(
      AppConstLang.toChangePass.tr,
      () {
        Get.lazyPut<ChangePassControllerImp>(() => ChangePassControllerImp());
        Get.toNamed(AppRoute.changePasswordScreen, arguments: {'user': user});
      },
    );
  }

  @override
  void deleteAccount() {
    CustomDialog.checkPassDialog(
      AppConstLang.toDeleteAccount.tr,
      () {
        GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();
        String deleteString = "";

        void onConfirm() async {
          if (key.currentState!.validate()) {
            Get.back();
            if (deleteString.toLowerCase().trim() ==
                AppConstLang.deleteConfirm.tr.toLowerCase()) {
              bool deleted = await UpdateUser.deleteUser();
              if (deleted) {
                await CustomDialog.warningDialog(
                  AppConstLang.accountSuccessfullyDeleted.tr,
                );
              }
            } else {
              CustomDialog.errorDialog(AppConstLang.wrongCode.tr);
            }
          }
        }

        Get.defaultDialog(
          buttonColor: AppColor.primary,
          confirmTextColor: Colors.white,
          title: AppConstLang.warning.tr,
          content: DeleteAccountWidget(
            fieldKey: key,
            onChanged: (val) => deleteString = val.trim(),
            onFieldSubmitted: (val) => onConfirm(),
          ),
          textCancel: AppConstLang.cancel.tr,
          textConfirm: AppConstLang.confirm.tr,
          onConfirm: onConfirm,
        );
      },
    );
  }

  // for image ---------------------

  @override
  void onSelectInPopUpButton(EditPhoto item) async {
    if (await NetHelper.checkInternet()) {
      bool watchAd = await RewardedInterstitialAdsHelper.showAd();
      if (watchAd) {
        switch (item) {
          case EditPhoto.delete:
            await _changePhoto(null);

            break;
          default:
            await AppBottomSheets.pickPhoto();
        }
      }
    } else {
      CustomDialog.errorDialog(AppConstLang.noInternet.tr);
    }
  }

  @override
  Future<bool> pickImage(ImageSource source) async {
    File? file = await PhotoHelper.getImage(source);
    if (file == null) return false;
    File? crop = await PhotoHelper.cropImage(file);
    if (crop == null) {
      return AppConstant.isAndroidOrIOS || AppConstant.isWeb
          ? false
          : await _changePhoto(file);
    }
    return await _changePhoto(crop);
  }

  Future<bool> _changePhoto(File? file) async {
    if (Get.isBottomSheetOpen ?? false) Get.back();

    String email = user!.email;
    user = null;
    update();

    UserData? temp = await UpdateUser.changePhoto(email, file);

    user = LoginRemotely.savedLogin();
    update();

    return temp != null;
  }
  // ----------end image --------------
}
