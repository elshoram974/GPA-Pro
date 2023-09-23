import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

abstract class PhotoHelper {
  static Future<File?> getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    return image == null ? null : File(image.path);
  }

  static Future<File?> cropImage(File image) async {
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
            initAspectRatio: CropAspectRatioPreset.square,
            activeControlsWidgetColor: AppColor.primary,
            lockAspectRatio: false,
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
