import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/popup_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPopupMenuButton extends StatelessWidget {
  const MyPopupMenuButton({
    super.key,
    required this.pageType,
    this.f,
    this.showWhenSelected = false,
    required this.subjectsToSave,
  });
  final bool showWhenSelected;
  final PageType pageType;
  final void Function()? f;
  final List<SubjectModel> subjectsToSave;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PopupButton>(
      tooltip: AppConstLang.moreOptions.tr,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
      ),
      position: PopupMenuPosition.under,
      splashRadius: AppConstant.kDefaultRadius,
      onSelected: (value) => AppInjections.mainScreenImp.onSelected(
        value,
        f,
        subjectsToSave,
        !showWhenSelected,
      ),
      itemBuilder: (context) =>
          AppInjections.mainScreenImp.popupList(pageType, showWhenSelected),
    );
  }
}
