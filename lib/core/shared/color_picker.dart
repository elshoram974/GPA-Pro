import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class MyColorPicker extends StatelessWidget {
  final Color pickerColor;
  final void Function(Color) onColorChanged;
  final void Function()? onPressed;
  const MyColorPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: AppConstant.kDefaultPadding * 2,
                right: AppConstant.kDefaultPadding * 2,
                left: AppConstant.kDefaultPadding * 2,
              ),
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: onColorChanged,
                displayThumbColor: true,
                hexInputBar: true,
                portraitOnly: true,
                pickerAreaBorderRadius: BorderRadius.circular(
                  AppConstant.kDefaultRadius * 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: AppConstant.kDefaultPadding * 1.5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onPressed,
                      child: Text(AppConstLang.select.tr),
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      onPressed: Get.back,
                      child: Text(AppConstLang.cancel.tr),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
