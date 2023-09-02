import 'dart:io';

import 'package:gpa_pro/core/constants/assets.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/constants/saved_constants.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/rate_app.dart';
import 'package:gpa_pro/core/functions/save/save_folder.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/year_model.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/pdf/pdf_page.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';

class PdfGenerator {
  static late Font myFont;
  static double width = 29.7 * PdfPageFormat.cm;
  static double margin = 0.75 * PdfPageFormat.cm;

  static Future<void> createPdf({
    required List<YearModel> years,
    required int releaseHours,
  }) async {
    await init();
    String fileName = AppSavedConst.savedPDFName;

    final Document pdf = Document();

    Uint8List myImage =
        (await rootBundle.load(AppAssets.mrePDFLogo)).buffer.asUint8List();

    List<YearModel> tempYears = [];
    for (YearModel year in years) {
      tempYears.add(year);
      pdf.addPage(
        _myPage(
          year: year,
          tempYears: tempYears,
          releaseHours: releaseHours,
          myImage: myImage,
        ),
      );
    }
    tempYears.clear();

    Uint8List bytes = await pdf.save();

    String filePath = await SaveFolder.savePDF(fileName, bytes);
    Get.back();

    await CustomDialog.warningDialog(
      AppConstLang.doUWantToOpenFile.tr,
      onConfirm: () async {
        Get.back();

        OpenResult x = await OpenFile.open(filePath);
        if (x.type != ResultType.done) {
          AppInjections.mainScreenImp.homeNavigatorKey.currentState!.pushNamed(
            AppRoute.pdf,
            arguments: File(filePath),
          );
        }
      },
    );
    Get.back();
    AppSnackBar.messageSnack(AppConstLang.savedInDownload.tr);
    RateApp.rateAppDialog();
  }

  static Page _myPage({
    required YearModel year,
    required List<YearModel> tempYears,
    required int releaseHours,
    required Uint8List myImage,
  }) {
    List<YearModel> years = [];
    years.addAll(tempYears);

    return Page(
      theme: ThemeData.withFont(base: myFont),
      textDirection: TextDirection.rtl,
      pageFormat: PdfPageFormat(width, double.infinity, marginAll: margin),
      build: (Context context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            myPage(year, years, releaseHours, width, myFont),
            Opacity(
              opacity: 0.2,
              child: Image(
                MemoryImage(myImage),
                alignment: Alignment.center,
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<void> init() async {
    myFont = Font.ttf(await rootBundle.load(AppAssets.amiriFont));
  }
}
