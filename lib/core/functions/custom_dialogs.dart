import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/shared/custom_fields/pass_field_controller.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/user.dart';

class CustomDialog {
  static Future<T?> loadDialog<T>({bool canBack = true, String? message}) {
    return Get.defaultDialog<T>(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      onWillPop: () async => canBack,
      content: SizedBox.square(
        child: message == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: AppConstant.kDefaultPadding),
                  Text(message),
                ],
              ),
      ),
    );
  }

  static Future<T?> _customDialog<T>(
    String title,
    String middleText, {
    String? textConfirm,
    required void Function()? onConfirm,
    required bool closeBeforeFunction,
    TextStyle? style,
  }) async {
    return await Get.defaultDialog<T>(
      buttonColor: AppColor.primary,
      confirmTextColor: Colors.white,
      title: AppConstLang.warning.tr,
      middleText: style == null ? middleText : '',
      content: style == null
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.kDefaultPadding,
                vertical: AppConstant.kDefaultPadding / 2,
              ),
              child: Text(middleText, style: style),
            ),
      textCancel: onConfirm != null ? AppConstLang.cancel.tr : null,
      textConfirm:
          textConfirm ?? (onConfirm != null ? AppConstLang.sure.tr : null),
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
    String? textConfirm,
    void Function()? onConfirm,
    bool closeBeforeFunction = false,
    TextStyle? style,
  }) async {
    return await _customDialog<T>(
      AppConstLang.warning.tr,
      middleText,
      textConfirm: textConfirm,
      onConfirm: onConfirm,
      closeBeforeFunction: closeBeforeFunction,
      style: style,
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
    void Function()? onConfirm, {
    TextStyle? style,
  }) {
    return warningDialog<T>(
      "${AppConstLang.areUSureUWanna.tr} $text",
      closeBeforeFunction: true,
      onConfirm: onConfirm,
      style: style,
    );
  }

  static Future<T?> backDialog<T>({
    String? middleText,
    String? textCancel,
    String? textConfirm,
    void Function()? onConfirm,
    required void Function() onCancel,
  }) async {
    return await Get.defaultDialog<T>(
      buttonColor: AppColor.primary,
      confirmTextColor: Colors.white,
      title: AppConstLang.warning.tr,
      middleText: middleText ?? AppConstLang.ifYouReturnChangesNotSaved.tr,
      textCancel: textCancel ?? AppConstLang.goBack.tr,
      textConfirm: textConfirm ?? AppConstLang.stayHere.tr,
      onConfirm: () {
        Get.back();
        if (onConfirm != null) onConfirm();
      },
      onCancel: onCancel,
    );
  }

  static Future<T?> cancelChanges<T>({
    bool isCancel = true,
    required void Function() onConfirm,
    required void Function() onCancel,
  }) async {
    return backDialog(
      textCancel: AppConstLang.dontSave.tr,
      textConfirm: AppConstLang.saveChanges.tr,
      middleText: isCancel
          ? AppConstLang.ifCancelBackChangesNotSaved.tr
          : AppConstLang.ifYouReturnChangesNotSaved.tr,
      onConfirm: onConfirm,
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

  static Future<T?> checkPassDialog<T>(
    String message,
    void Function() confirmFn,
  ) {
    GlobalKey<FormFieldState> key = GlobalKey<FormFieldState>();
    String pass = "";

    void onConfirm() {
      if (key.currentState!.validate()) {
        Get.back();
        UserData? user = LoginRemotely.savedLogin();
        if (pass == user?.password) {
          confirmFn();
        } else {
          CustomDialog.errorDialog(AppConstLang.wrongPassword.tr);
        }
      }
    }

    return Get.defaultDialog<T>(
      buttonColor: AppColor.primary,
      confirmTextColor: Colors.white,
      title: AppConstLang.warning.tr,
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstant.kDefaultPadding,
          vertical: AppConstant.kDefaultPadding / 2,
        ),
        child: Column(
          children: [
            Text("${AppConstLang.pleaseEnterPass.tr} $message"),
            const SizedBox(height: 2 * AppConstant.kDefaultPadding),
            DefaultPassWidget(
              fieldKey: key,
              changeTextColorToBlack: false,
              onChanged: (val) => pass = val,
              onFieldSubmitted: (val) => onConfirm(),
            ),
          ],
        ),
      ),
      textCancel: AppConstLang.cancel.tr,
      textConfirm: AppConstLang.confirm.tr,
      onConfirm: onConfirm,
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
