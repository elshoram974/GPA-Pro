import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/save/pdf/pdf_generator.dart';
import 'package:gpa_pro/core/functions/save/save_folder.dart';
import 'package:gpa_pro/core/functions/save/text/text_functions.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_bottom_sheet.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveBottomModelSheet extends StatelessWidget {
  const SaveBottomModelSheet(
      {super.key, required this.subjectsToSave, required this.showPDF});

  final List<SubjectModel> subjectsToSave;
  final bool showPDF;

  @override
  Widget build(BuildContext context) {
    return MyBottomModelSheet(
      widgets: [
        Visibility(
          visible: showPDF,
          child: CustomListTile(
            title: AppConstLang.savePDF.tr,
            trailingIcon: Icons.picture_as_pdf_outlined,
            onTap: () async {
              SaveFolder.waitToSaveDialog();
              await PdfGenerator.createPdf(
                years: AppInjections.homeController.yearsList,
                releaseHours: AppInjections.homeController.releaseHours,
              );
            },
          ),
        ),
        CustomListTile(
          title: AppConstLang.saveTXT.tr,
          trailingIcon: Icons.save_outlined,
          onTap: () => SaveText.onTapSave(subjectsToSave),
        ),
      ],
    );
  }
}
