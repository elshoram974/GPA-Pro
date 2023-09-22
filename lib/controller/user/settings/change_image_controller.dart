import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/class/net_helper.dart';
import 'package:gpa_pro/core/class/update_user.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/my_bottom_sheets.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum EditPhoto { add, change, delete }

abstract class ChangePhotoHandler extends GetxController {
  void onSelectInPopUpButton(EditPhoto item);
  Future<bool> changePhoto(File? file);
  Future<bool> pickImage(ImageSource source);
  Future<File?> getImage(ImageSource source);
  Future<File?> cropImage(File image);
}

class ChangePhotoHandlerImp extends ChangePhotoHandler {
  UserData? user;

  @override
  void onInit() {
    user = LoginRemotely.savedLogin();
    super.onInit();
  }

  @override
  void onSelectInPopUpButton(EditPhoto item) async {
    if (await NetHelper.checkInternet()) {
      switch (item) {
        case EditPhoto.delete:
          await changePhoto(null);

          break;
        default:
          await AppBottomSheets.pickPhoto();
      }
    } else {
      CustomDialog.errorDialog(AppConstLang.noInternet.tr);
    }
  }

  @override
  Future<bool> changePhoto(File? file) async {
    if (Get.isBottomSheetOpen ?? false) Get.back();

    

    String email = user!.email;
    user = null;
    update();

    UserData? temp = await UpdateUser.changePhoto(email, file);

    user = LoginRemotely.savedLogin();
    update();

    return temp != null;
  }

  @override
  Future<bool> pickImage(ImageSource source) async {
    File? file = await getImage(source);
    if (file == null) return false;
    File? crop = await cropImage(file);
    if (crop == null) {
      return AppConstant.isAndroidOrIOS || AppConstant.isWeb
          ? false
          : await changePhoto(file);
    }
    return await changePhoto(crop);
  }

  @override
  Future<File?> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    return image == null ? null : File(image.path);
  }

  @override
  Future<File?> cropImage(File image) async {
    if (AppConstant.isAndroidOrIOS || AppConstant.isWeb) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: AppConstLang.edit.tr,
            toolbarColor: AppColor.primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            activeControlsWidgetColor: AppColor.primary,
            lockAspectRatio: true,
          ),
          IOSUiSettings(title: AppConstLang.edit.tr),
          // WebUiSettings(context: context),
        ],
      );

      return croppedFile == null ? null : File(croppedFile.path);
    }
    return null;
  }
}
