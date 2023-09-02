import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static Future<T?> loadDialog<T>() {
    return Get.dialog<T>(
      const SimpleDialog(
        children: [
          SizedBox.square(
            child: Center(child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }

  static Future<T?> _customDialog<T>(
    String title,
    String middleText, {
    required void Function()? onConfirm,
    required bool closeBeforeFunction,
  }) async {
    return await Get.defaultDialog<T>(
      buttonColor: AppColor.primary,
      confirmTextColor: Colors.white,
      title: AppConstLang.warning.tr,
      middleText: middleText,
      textCancel: onConfirm != null ? AppConstLang.cancel.tr : null,
      textConfirm: onConfirm != null ? AppConstLang.sure.tr : null,
      onConfirm: onConfirm != null
          ? () {
              if (closeBeforeFunction) {
                Get.back();
              }
              onConfirm();
              if (!closeBeforeFunction) {
                Get.back();
              }
            }
          : null,
    );
  }

  static Future<T?> warningDialog<T>(
    String middleText, {
    void Function()? onConfirm,
    bool closeBeforeFunction = false,
  }) async {
    return await _customDialog<T>(
      AppConstLang.warning.tr,
      middleText,
      onConfirm: onConfirm,
      closeBeforeFunction: closeBeforeFunction,
    );
  }

  static Future<T?> errorDialog<T>(
    String middleText, {
    void Function()? onConfirm,
    bool closeBeforeFunction = false,
  }) async {
    return await _customDialog<T>(
      AppConstLang.error.tr,
      middleText,
      onConfirm: onConfirm,
      closeBeforeFunction: closeBeforeFunction,
    );
  }

  static Future<T?> warningBeforeConfirm<T>(
    String text,
    void Function()? onConfirm,
  ) {
    return warningDialog<T>(
      "${AppConstLang.areUSureUWanna.tr} $text",
      closeBeforeFunction: true,
      onConfirm: onConfirm,
    );
  }

  static Future<T?> cancelChanges<T>({
    bool isCancel = true,
    required void Function() onConfirm,
    required void Function() onCancel,
  }) async {
    return await Get.defaultDialog<T>(
      buttonColor: AppColor.primary,
      confirmTextColor: Colors.white,
      title: AppConstLang.warning.tr,
      middleText: isCancel
          ? AppConstLang.ifCancelBackChangesNotSaved.tr
          : AppConstLang.ifYouReturnChangesNotSaved.tr,
      textCancel: AppConstLang.dontSave.tr,
      textConfirm: AppConstLang.saveChanges.tr,
      onConfirm: () => {Get.back(), onConfirm()},
      onCancel: onCancel,
    );
  }

  static Future<T?> simple<T>({
    String title = '',
    required String middleText,
    String? textConfirm,
    String? textCancel,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    return Get.defaultDialog<T>(
      buttonColor: AppColor.primary,
      confirmTextColor: Colors.white,
      title: title,
      titleStyle: title == '' ? const TextStyle(fontSize: 0) : null,
      middleText: middleText,
      textConfirm: textConfirm,
      textCancel: textCancel,
      onConfirm: onConfirm == null
          ? null
          : () {
              Get.back();
              onConfirm();
            },
      onCancel: onCancel,
      titlePadding: title == '' ? EdgeInsets.zero : null,
    );
  }

  static Future<T?> colorPicker<T>(
    BuildContext context, {
    Color? pickerColor,
    required void Function(Color? color) onConfirm,
  }) async {
    Color? selectedColor;
    return await showDialog(
      context: context,
      builder: (context) {
        return MyColorPicker(
          pickerColor: pickerColor ?? context.theme.scaffoldBackgroundColor,
          onColorChanged: (newColor) => selectedColor = newColor,
          onPressed: () {
            onConfirm(selectedColor);
            Get.back();
          },
        );
      },
    );
  }
}
