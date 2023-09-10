import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/gpa_functions.dart';
import 'package:gpa_pro/data/datasource/database/subjects/subject_table_db.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:gpa_pro/data/model/shared/get_shared_subjects_model.dart';
import 'package:gpa_pro/data/model/year_model.dart';
import 'package:get/get.dart';

class SubjectModel extends ParentModel {
  final int? remoteId;
  final String semester;
  final String year;
  final String? nameAr;
  final String nameEn;
  String? note;

  final double? myMidDegree;
  final double? myYearWorkDegree; // اعمال السنة
  double? myPracticalDegree; // عملي و شفوي
  final double? myFinalDegree;

  final double? maxMidDegree;
  final double? maxYearWorkDegree; // اعمال السنة
  final double? maxPracticalDegree; // عملي و شفوي
  final double? maxFinalDegree;

  final double? savedGPA;

  SubjectModel({
    this.remoteId,
    required this.nameEn,
    this.nameAr,
    this.savedGPA,
    this.note,
    this.myMidDegree,
    this.myYearWorkDegree,
    this.myPracticalDegree,
    this.myFinalDegree,
    this.maxMidDegree,
    this.maxYearWorkDegree,
    this.maxPracticalDegree,
    this.maxFinalDegree,
    required int id,
    required double degree,
    required double maxDegree,
    required int hours,
    required this.semester,
    required this.year,
    bool isSelected = false,
    bool isCalculated = true,
  }) : super(
          id: id,
          name: AppInjections.locale.retAr<String>(nameAr ?? nameEn, nameEn),
          degree: degree,
          hours: hours,
          maxDegree: maxDegree,
          gpa: savedGPA ??
              GPAFunctions.gpaResult(
                "${100 * (degree / maxDegree)}",
                GradeType.degree,
                hours,
              ),
          address:
              ".../${year.tr}/${semester.tr}/${AppInjections.locale.retAr<String>(nameAr ?? nameEn, nameEn)}",
          isCalculated: isCalculated,
          isSelected: isSelected,
        );

  //       {
  //   // assert((maxMidDegree ?? 0) + (maxWorkYearDegree??0) + (maxPracticalDegree??0 )+ (maxFinalDegree??0) != maxDegree);
  //   assert(degree <= maxDegree && maxDegree != 0);
  //   if (myMidDegree != null && maxMidDegree != null) {
  //     assert(myMidDegree! <= maxMidDegree!);
  //   }
  //   if (myYearWorkDegree != null && maxYearWorkDegree != null) {
  //     assert(myYearWorkDegree! <= maxYearWorkDegree!);
  //   }
  //   if (myPracticalDegree != null && maxPracticalDegree != null) {
  //     assert(myPracticalDegree! <= maxPracticalDegree!);
  //   }
  //   if (myFinalDegree != null && maxFinalDegree != null) {
  //     assert(myFinalDegree! <= maxFinalDegree!);
  //   }
  // }

  bool isEqualByNameAddress(SubjectModel otherSubject) {
    // return id == otherSubject.id;
    return ((nameAr == otherSubject.nameAr || nameEn == otherSubject.nameEn) &&
        (address == otherSubject.address) &&
        (hours == otherSubject.hours));
  }

  bool isAllEqual(SubjectModel otherSubject) {
    return nameAr == otherSubject.nameAr &&
        nameEn == otherSubject.nameEn &&
        semester == otherSubject.semester &&
        year == otherSubject.year &&
        degree == otherSubject.degree &&
        gpa == otherSubject.gpa &&
        hours == otherSubject.hours &&
        isCalculated == otherSubject.isCalculated &&
        maxDegree == otherSubject.maxDegree &&
        maxFinalDegree == otherSubject.maxFinalDegree &&
        maxMidDegree == otherSubject.maxMidDegree &&
        maxPracticalDegree == otherSubject.maxPracticalDegree &&
        maxYearWorkDegree == otherSubject.maxYearWorkDegree &&
        myFinalDegree == otherSubject.myFinalDegree &&
        myMidDegree == otherSubject.myMidDegree &&
        myPracticalDegree == otherSubject.myPracticalDegree &&
        myYearWorkDegree == otherSubject.myYearWorkDegree &&
        note == otherSubject.note &&
        address == otherSubject.address;
  }

  factory SubjectModel.fromApi(SharedSubjectElement api) => SubjectModel(
        nameEn: api.subjectNameEn!,
        nameAr: api.subjectNameAr!,
        id: api.subjectId ?? 0,
        remoteId: api.remoteId,
        degree: api.subjectDegree!,
        maxDegree: api.subjectMaxDegree!,
        hours: api.subjectHours!,
        semester: api.subjectSemester!,
        year: api.subjectYear!,
        isCalculated: api.subjectIsCalculated,
        maxFinalDegree: api.subjectMaxFinalDegree,
        maxMidDegree: api.subjectMaxMidDegree,
        maxPracticalDegree: api.subjectMaxPracticalDegree,
        maxYearWorkDegree: api.subjectMaxYearWorkDegree,
        myFinalDegree: api.subjectMyFinalDegree,
        myMidDegree: api.subjectMyMidDegree,
        myPracticalDegree: api.subjectMyPracticalDegree,
        myYearWorkDegree: api.subjectMyYearWorkDegree,
        note: api.subjectNote,
        savedGPA: api.subjectGpa,
      );

  factory SubjectModel.getNewEmpty() => SubjectModel(
        id: 0,
        nameEn: "",
        degree: 0.0,
        maxDegree: 100.0,
        hours: 0,
        semester: '',
        year: '',
      );

  factory SubjectModel.fromJson(Map<String, dynamic> map) {
    if (!SemesterModel.semesters.contains(map[SubjectTableDB.semester])) {
      throw "this semester not exist";
    } else if (!YearModel.years.contains(map[SubjectTableDB.year])) {
      throw "this year not exist";
    } else if (map[SubjectTableDB.nameAr] == null) {
      map[SubjectTableDB.nameAr] = map[SubjectTableDB.nameEn]!;
    }
    return SubjectModel(
      id: map[SubjectTableDB.id] ?? 0,
      remoteId: map[SubjectTableDB.remoteId],
      nameEn: map[SubjectTableDB.nameEn]!,
      nameAr: map[SubjectTableDB.nameAr]!,
      degree: map[SubjectTableDB.degree]!,
      savedGPA: map[SubjectTableDB.gpa],
      maxDegree: map[SubjectTableDB.maxDegree]!,
      hours: map[SubjectTableDB.hours]!,
      semester: map[SubjectTableDB.semester]!,
      year: map[SubjectTableDB.year]!,
      isCalculated: map[SubjectTableDB.isCalculated] == 1,
      maxFinalDegree: map[SubjectTableDB.maxFinalDegree],
      maxPracticalDegree: map[SubjectTableDB.maxPracticalDegree],
      maxYearWorkDegree: map[SubjectTableDB.maxYearWorkDegree],
      maxMidDegree: map[SubjectTableDB.maxMidDegree],
      myFinalDegree: map[SubjectTableDB.myFinalDegree],
      myPracticalDegree: map[SubjectTableDB.myPracticalDegree],
      myYearWorkDegree: map[SubjectTableDB.myYearWorkDegree],
      myMidDegree: map[SubjectTableDB.myMidDegree],
      note: map[SubjectTableDB.note],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[SubjectTableDB.id] = id;
    data[SubjectTableDB.nameEn] = nameEn;
    data[SubjectTableDB.nameAr] = nameAr;
    data[SubjectTableDB.degree] = degree;
    data[SubjectTableDB.gpa] = savedGPA;
    data[SubjectTableDB.maxDegree] = maxDegree;
    data[SubjectTableDB.hours] = hours;
    data[SubjectTableDB.semester] = semester;
    data[SubjectTableDB.year] = year;
    data[SubjectTableDB.isCalculated] = isCalculated ? 1 : 0;
    data[SubjectTableDB.maxFinalDegree] = maxFinalDegree;
    data[SubjectTableDB.maxPracticalDegree] = maxPracticalDegree;
    data[SubjectTableDB.maxYearWorkDegree] = maxYearWorkDegree;
    data[SubjectTableDB.maxMidDegree] = maxMidDegree;
    data[SubjectTableDB.myFinalDegree] = myFinalDegree;
    data[SubjectTableDB.myPracticalDegree] = myPracticalDegree;
    data[SubjectTableDB.myYearWorkDegree] = myYearWorkDegree;
    data[SubjectTableDB.myMidDegree] = myMidDegree;
    data[SubjectTableDB.note] = note;

    return data;
  }

  Map<String, dynamic> toMapWithoutId() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[SubjectTableDB.nameEn] = nameEn;
    data[SubjectTableDB.nameAr] = nameAr;
    data[SubjectTableDB.degree] = degree;
    data[SubjectTableDB.gpa] = savedGPA;
    data[SubjectTableDB.maxDegree] = maxDegree;
    data[SubjectTableDB.hours] = hours;
    data[SubjectTableDB.semester] = semester;
    data[SubjectTableDB.year] = year;
    data[SubjectTableDB.isCalculated] = isCalculated ? 1 : 0;
    data[SubjectTableDB.maxFinalDegree] = maxFinalDegree;
    data[SubjectTableDB.maxPracticalDegree] = maxPracticalDegree;
    data[SubjectTableDB.maxYearWorkDegree] = maxYearWorkDegree;
    data[SubjectTableDB.maxMidDegree] = maxMidDegree;
    data[SubjectTableDB.myFinalDegree] = myFinalDegree;
    data[SubjectTableDB.myPracticalDegree] = myPracticalDegree;
    data[SubjectTableDB.myYearWorkDegree] = myYearWorkDegree;
    data[SubjectTableDB.myMidDegree] = myMidDegree;
    data[SubjectTableDB.note] = note;

    return data;
  }
}
