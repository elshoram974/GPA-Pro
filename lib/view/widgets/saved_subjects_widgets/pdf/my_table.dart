import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/core/functions/patterns.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/pdf/bold_text.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

TableRow myTable(
  SemesterModel semester,
  double width,
  Font? myFont, {
  bool name = false,
  bool gpa = false,
  bool degree = false,
  bool hours = false,
}) {
  String header = '';

  return TableRow(
    verticalAlignment: TableCellVerticalAlignment.middle,
    decoration: BoxDecoration(
      border: Border.all(),
      color: PdfColors.grey100,
      borderRadius: BorderRadius.vertical(
        top: name ? const Radius.circular(15) : Radius.zero,
      ),
    ),
    children: [
      ...List.generate(
        semester.subjects.length,
        (index) {
          String text = '';

          if (name) {
            text = semester.subjects[index].name;
            header = AppConstLang.subject.tr;
          } else if (gpa) {
            text = semester.subjects[index].gpa.toString();
            header = "GPA";
          } else if (degree) {
            text = semester.subjects[index].degree.toString();
            header = AppConstLang.degree.tr;
          } else if (hours) {
            text = semester.subjects[index].hours.toString();
            header = AppConstLang.noHour.tr;
          } else {
            text = GPAFunctions.gradeResult(
              semester.subjects[index].gpa.toString(),
              GradeType.gpa,
              semester.subjects[index].hours,
            );
            header = AppConstLang.grade.tr;
          }
          GPAFunctionsHelper subjectGPAHelper =
              GPAFunctionsHelper([semester.subjects[index]]);

          return Container(
            width: (width / semester.subjects.length),
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: subjectGPAHelper.pdfColor(),
              borderRadius: name && index == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(AppConstant.kDefaultRadius),
                    )
                  : null,
            ),
            child: FittedBox(
              child: Text(
                " $text ",
                style: TextStyle(
                  fontSize: name ? 24 : 20,
                  font: myFont,
                  fontWeight: name ? FontWeight.bold : null,
                  color: AppColor.pdfTextColor(),
                ),
                textAlign: TextAlign.center,
                textDirection: AppPatterns.isArabic(text)
                    ? TextDirection.rtl
                    : TextDirection.ltr,
              ),
            ),
          );
        },
      ),
      boldText(header, myFont, semester: semester, isHeader: true),
    ],
  );
}
