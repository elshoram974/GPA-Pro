import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/change_image_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/services/permissions.dart';
import 'package:gpa_pro/core/shared/custom_bottom_sheet.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:image_picker/image_picker.dart';

class PickPhotoWidget extends GetView<ChangePhotoHandlerImp> {
  const PickPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = AppConstant.isDesktop;
    return MyBottomModelSheet(
      widgets: [
        if (!isDesktop)
          CustomListTile(
            title: AppConstLang.openCamera.tr,
            onTap: () async {
              await AppPermissions.camera();
              await controller.pickImage(ImageSource.camera);
            },
          ),
        CustomListTile(
          title: isDesktop
              ? AppConstLang.openFiles.tr
              : AppConstLang.openGallery.tr,
          onTap: () async => await controller.pickImage(ImageSource.gallery),
        ),
      ],
    );
  }
}
