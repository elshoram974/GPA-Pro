import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/change_image_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
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
            title: "camera",
            onTap: () => controller.pickImage(ImageSource.camera),
          ),
        CustomListTile(
          title: isDesktop ? "file" : "Gallery",
          onTap: () => controller.pickImage(ImageSource.gallery),
        ),
      ],
    );
  }
}