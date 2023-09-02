import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/pdf/bold_text.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/pdf/my_table.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Column tableInTerm(SemesterModel semester, double width, Font? myFont) {
  GPAFunctionsHelper semesterGPAHelper = GPAFunctionsHelper([semester]);

  return Column(
    children: [
      SizedBox(height: 15),
      boldText(semester.name.tr, myFont),
      Table(
        border: TableBorder.symmetric(inside: const BorderSide()),
        children: [
          myTable(semester, width, myFont, name: true),
          myTable(semester, width, myFont),
          myTable(semester, width, myFont, gpa: true),
          myTable(semester, width, myFont, degree: true),
          myTable(semester, width, myFont, hours: true),
        ],
      ),
      Container(
        decoration: BoxDecoration(
          color: semesterGPAHelper.pdfColor() ?? PdfColors.blueGrey,
          border: Border.all(),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            boldText(
              "${AppConstLang.grade.tr}:- ${semesterGPAHelper.grade()}",
              myFont,
            ),
            boldText(
              "GPA:- ${semester.gpa.toPrecision(3)}",
              myFont,
            ),
            boldText(
              "${AppConstLang.noHour.tr}:- ${semester.hours}",
              myFont,
            ),
          ],
        ),
      ),
      SizedBox(height: 15),
    ],
  );
}
