import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/patterns.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/data/model/year_model.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/pdf/bold_text.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/pdf/table_in_term.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Container myPage(
  YearModel year,
  List<YearModel> tempYears,
  int releaseHours,
  double width,
  Font? myFont,
) {
  GPAFunctionsHelper gpaHelper = GPAFunctionsHelper(tempYears);
  GPAFunctionsHelper yearGPAHelper = GPAFunctionsHelper([year]);

  return Container(
    alignment: Alignment.center,
    child: Column(
      children: [
        Text(
          year.name.tr,
          style: const TextStyle(fontSize: 30),
          textDirection: AppPatterns.isArabic(year.name.tr)
              ? TextDirection.rtl
              : TextDirection.ltr,
        ),
        for (SemesterModel semester in year.semesters)
          tableInTerm(semester, width, myFont),
        SizedBox(height: 30),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: yearGPAHelper.pdfColor() ?? PdfColors.blueGrey,
            border: Border.all(),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!AppInjections.locale.isArabicLang)
                    boldText(
                      "${AppConstLang.inThisYear.tr}:- ",
                      myFont,
                    ),
                  boldText(
                    "${AppConstLang.grade.tr}:- ${yearGPAHelper.grade()}",
                    myFont,
                  ),
                  boldText(
                    "GPA:- ${year.gpa.toPrecision(3)}",
                    myFont,
                  ),
                  boldText(
                    "${AppConstLang.noHour.tr}:- ${year.hours}",
                    myFont,
                  ),
                  if (AppInjections.locale.isArabicLang)
                    boldText(
                      "${AppConstLang.inThisYear.tr}:- ",
                      myFont,
                    ),
                ],
              ),
              Divider(indent: 20, endIndent: 20, height: 20),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!AppInjections.locale.isArabicLang)
                      boldText(
                        "${AppConstLang.inPreviousYears.tr}:- ",
                        myFont,
                      ),
                    boldText(
                      "${AppConstLang.grade.tr}:- ${gpaHelper.grade()}",
                      myFont,
                    ),
                    boldText(
                      "${AppConstLang.theCumulative.tr}:- ${gpaHelper.gpaCumulative().toPrecision(3)}",
                      myFont,
                    ),
                    boldText(
                      "${AppConstLang.realizedHours.tr}:- ${gpaHelper.noHours() + releaseHours}",
                      myFont,
                    ),
                    boldText(
                      "${AppConstLang.noHour.tr}:- ${gpaHelper.noHours()}",
                      myFont,
                    ),
                    if (AppInjections.locale.isArabicLang)
                      boldText(
                        "${AppConstLang.inPreviousYears.tr}:- ",
                        myFont,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
