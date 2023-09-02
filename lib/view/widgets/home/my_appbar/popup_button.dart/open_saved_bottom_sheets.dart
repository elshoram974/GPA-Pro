import 'package:gpa_pro/core/functions/save/text/text_functions.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_bottom_sheet.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenSavedBottomModelSheet extends StatelessWidget {
  const OpenSavedBottomModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MyBottomModelSheet(
      widgets: [
        CustomListTile(
          title: AppConstLang.openSavedTxt.tr,
          trailingIcon: Icons.file_upload_outlined,
          onTap: SaveText.getSavedFileInMemory,
        ),
        CustomListTile(
          title: AppConstLang.getSubjectsWithLink.tr,
          trailingIcon: Icons.link_outlined,
          onTap: SaveText.getSubjectsWithLink,
        ),
        // CustomListTile(
        //   title: "open_saved_excel".tr,
        //   trailingIcon: Icons.upload_file,
        //   onTap: (){},
        // ),
      ],
    );
  }
}
