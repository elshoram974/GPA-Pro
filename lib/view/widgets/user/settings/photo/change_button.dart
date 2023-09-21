import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/change_image_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';


class ChangeButton extends GetView<ChangePhotoHandlerImp> {
  const ChangeButton({super.key, required this.hasPhoto});
  final bool hasPhoto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5 * AppConstant.kDefaultPadding),
      child: PopupMenuButton<EditPhoto>(
        tooltip: AppConstLang.edit.tr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
        ),
        position: PopupMenuPosition.under,
        splashRadius: AppConstant.kDefaultRadius,
        onSelected: controller.onSelectInPopUpButton,
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<EditPhoto>>[
            if (!hasPhoto)
              PopupMenuItem<EditPhoto>(
                value: EditPhoto.add,
                child: Text(AppConstLang.add.tr),
              ),
            if (hasPhoto) ...[
              PopupMenuItem<EditPhoto>(
                value: EditPhoto.change,
                child: Text(AppConstLang.change.tr),
              ),
              PopupMenuItem<EditPhoto>(
                value: EditPhoto.delete,
                child: Text(AppConstLang.remove.tr),
              ),
            ],
          ];
        },
        child: const FaIcon(FontAwesomeIcons.penToSquare),
      ),
    );
  }
}
