import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/functions/patterns.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';

Container boldText(
  String text,
  Font? myFont, {
  SemesterModel? semester,
  bool isHeader = false,
}) {
  return Container(
    width: semester == null ? null : 150,
    height: 35,
    alignment: Alignment.center,
    decoration: isHeader
        ? BoxDecoration(
            color: PdfColors.teal100,
            borderRadius: text == AppConstLang.subject.tr
                ? const BorderRadius.only(topRight: Radius.circular(15))
                : null,
          )
        : null,
    child: FittedBox(
      child: Text(
        "  $text  ",
        style: TextStyle(
          color: isHeader ? null : AppColor.pdfTextColor(),
          font: myFont,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        textDirection:
            AppPatterns.isArabic(text) ? TextDirection.rtl : TextDirection.ltr,
      ),
    ),
  );
}
