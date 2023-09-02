import 'package:gpa_pro/controller/home/add_controller/dialog_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsCalCulated extends StatelessWidget {
  const IsCalCulated({super.key, required this.dialogController});
  final DialogControllerImp dialogController;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      dense: true,
      title: Text(AppConstLang.wantToCalcIt.tr),
      subtitle: Text(AppConstLang.doUWantToCalculateIt.tr),
      value: dialogController.isCalculated,
      onChanged: dialogController.onChangeCalculated,
    );
  }
}
