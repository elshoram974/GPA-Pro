import 'dart:convert';

import 'package:gpa_pro/data/model/subject_model.dart';

class SharedSubject {
  final String status;
  final SharedSubjectsData data;

  SharedSubject({
    required this.status,
    required this.data,
  });

  SharedSubject copyWith({
    String? status,
    SharedSubjectsData? data,
  }) =>
      SharedSubject(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory SharedSubject.fromRawJson(String str) =>
      SharedSubject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SharedSubject.fromJson(Map<String, dynamic> json) => SharedSubject(
        status: json["status"],
        data: SharedSubjectsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class SharedSubjectsData {
  final String? userSharedId;
  final String? message;
  final List<SharedSubjectElement> sharedSubjects;

  SharedSubjectsData({
    this.userSharedId,
    this.message,
    required this.sharedSubjects,
  });

  List<SubjectModel> get subjects {
    List<SubjectModel> subjects = [];

    for (SharedSubjectElement e in sharedSubjects) {
      subjects.add(SubjectModel.fromApi(e));
    }
    return subjects;
  }

  SharedSubjectsData copyWith({
    String? userSharedId,
    String? message,
    List<SharedSubjectElement>? sharedSubjects,
  }) =>
      SharedSubjectsData(
        userSharedId: userSharedId ?? this.userSharedId,
        message: message ?? this.message,
        sharedSubjects: sharedSubjects ?? this.sharedSubjects,
      );

  factory SharedSubjectsData.fromRawJson(String str) =>
      SharedSubjectsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SharedSubjectsData.fromJson(Map<String, dynamic> json) =>
      SharedSubjectsData(
        userSharedId: json["user_sharedId"],
        sharedSubjects: json["shared_subjects"] == null
            ? []
            : List<SharedSubjectElement>.from(json["shared_subjects"]!
                .map((x) => SharedSubjectElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_sharedId": userSharedId,
        "shared_subjects":
            List<dynamic>.from(sharedSubjects.map((x) => x.toJson())),
      };
}

class SharedSubjectElement {
  final int? subjectId;
  final int? remoteId;
  final int? subjectUser;
  final String? fromUser;
  final String? subjectNameEn;
  final String? subjectNameAr;
  final String? subjectNote;
  final double? subjectMyMidDegree;
  final double? subjectMyYearWorkDegree;
  final double? subjectMyPracticalDegree;
  final double? subjectMyFinalDegree;
  final double? subjectMaxMidDegree;
  final double? subjectMaxYearWorkDegree;
  final double? subjectMaxPracticalDegree;
  final double? subjectMaxFinalDegree;
  final double? subjectDegree;
  final double? subjectMaxDegree;
  final double? subjectGpa;
  final int? subjectHours;
  final bool subjectIsCalculated;
  final String? subjectSemester;
  final String? subjectYear;

  SharedSubjectElement({
    this.subjectId,
    this.remoteId,
    this.subjectUser,
    this.fromUser,
    this.subjectNameEn,
    this.subjectNameAr,
    this.subjectNote,
    this.subjectMyMidDegree,
    this.subjectMyYearWorkDegree,
    this.subjectMyPracticalDegree,
    this.subjectMyFinalDegree,
    this.subjectMaxMidDegree,
    this.subjectMaxYearWorkDegree,
    this.subjectMaxPracticalDegree,
    this.subjectMaxFinalDegree,
    this.subjectDegree,
    this.subjectMaxDegree,
    this.subjectGpa,
    this.subjectHours,
    this.subjectIsCalculated = true,
    this.subjectSemester,
    this.subjectYear,
  });

  SharedSubjectElement copyWith({
    int? subjectId,
    int? remoteId,
    int? subjectUser,
    String? fromUser,
    String? subjectNameEn,
    String? subjectNameAr,
    String? subjectNote,
    double? subjectMyMidDegree,
    double? subjectMyYearWorkDegree,
    double? subjectMyPracticalDegree,
    double? subjectMyFinalDegree,
    double? subjectMaxMidDegree,
    double? subjectMaxYearWorkDegree,
    double? subjectMaxPracticalDegree,
    double? subjectMaxFinalDegree,
    double? subjectDegree,
    double? subjectMaxDegree,
    double? subjectGpa,
    int? subjectHours,
    bool? subjectIsCalculated,
    String? subjectSemester,
    String? subjectYear,
  }) =>
      SharedSubjectElement(
        subjectId: subjectId ?? this.subjectId,
        remoteId: remoteId ?? this.remoteId,
        subjectUser: subjectUser ?? this.subjectUser,
        fromUser: fromUser ?? this.fromUser,
        subjectNameEn: subjectNameEn ?? this.subjectNameEn,
        subjectNameAr: subjectNameAr ?? this.subjectNameAr,
        subjectNote: subjectNote ?? this.subjectNote,
        subjectMyMidDegree: subjectMyMidDegree ?? this.subjectMyMidDegree,
        subjectMyYearWorkDegree:
            subjectMyYearWorkDegree ?? this.subjectMyYearWorkDegree,
        subjectMyPracticalDegree:
            subjectMyPracticalDegree ?? this.subjectMyPracticalDegree,
        subjectMyFinalDegree: subjectMyFinalDegree ?? this.subjectMyFinalDegree,
        subjectMaxMidDegree: subjectMaxMidDegree ?? this.subjectMaxMidDegree,
        subjectMaxYearWorkDegree:
            subjectMaxYearWorkDegree ?? this.subjectMaxYearWorkDegree,
        subjectMaxPracticalDegree:
            subjectMaxPracticalDegree ?? this.subjectMaxPracticalDegree,
        subjectMaxFinalDegree:
            subjectMaxFinalDegree ?? this.subjectMaxFinalDegree,
        subjectDegree: subjectDegree ?? this.subjectDegree,
        subjectMaxDegree: subjectMaxDegree ?? this.subjectMaxDegree,
        subjectGpa: subjectGpa ?? this.subjectGpa,
        subjectHours: subjectHours ?? this.subjectHours,
        subjectIsCalculated: subjectIsCalculated ?? this.subjectIsCalculated,
        subjectSemester: subjectSemester ?? this.subjectSemester,
        subjectYear: subjectYear ?? this.subjectYear,
      );

  factory SharedSubjectElement.fromRawJson(String str) =>
      SharedSubjectElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SharedSubjectElement.fromJson(Map<String, dynamic> json) =>
      SharedSubjectElement(
        subjectId: json["subject_id"],
        remoteId: json["remote_id"],
        subjectUser: json["subject_user"],
        fromUser: json["fromUser"],
        subjectNameEn: json["subject_nameEn"],
        subjectNameAr: json["subject_nameAr"],
        subjectNote: json["subject_note"],
        subjectMyMidDegree: double.tryParse('${json["subject_myMidDegree"]}'),
        subjectMyYearWorkDegree: double.tryParse('${json["subject_myYearWorkDegree"]}') ,
        subjectMyPracticalDegree: double.tryParse('${json["subject_myPracticalDegree"]}'),
        subjectMyFinalDegree: double.tryParse('${json["subject_myFinalDegree"]}'),
        subjectMaxMidDegree:double.tryParse('${json["subject_maxMidDegree"]}') ,
        subjectMaxYearWorkDegree: double.tryParse('${json["subject_maxYearWorkDegree"]}'),
        subjectMaxPracticalDegree: double.tryParse('${json["subject_maxPracticalDegree"]}'),
        subjectMaxFinalDegree: double.tryParse('${json["subject_maxFinalDegree"]}') ,
        subjectDegree: double.tryParse('${json["subject_degree"]}'),
        subjectMaxDegree: double.tryParse('${json["subject_maxDegree"]}'),
        subjectGpa:double.tryParse('${json["subject_gpa"]}'),
        subjectHours: json["subject_hours"],
        subjectIsCalculated: json["subject_isCalculated"] == 1 ? true : false,
        subjectSemester: json["subject_semester"],
        subjectYear: json["subject_year"],
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "remote_id": remoteId,
        "subject_user": subjectUser,
        "fromUser": fromUser,
        "subject_nameEn": subjectNameEn,
        "subject_nameAr": subjectNameAr,
        "subject_note": subjectNote,
        "subject_myMidDegree": subjectMyMidDegree,
        "subject_myYearWorkDegree": subjectMyYearWorkDegree,
        "subject_myPracticalDegree": subjectMyPracticalDegree,
        "subject_myFinalDegree": subjectMyFinalDegree,
        "subject_maxMidDegree": subjectMaxMidDegree,
        "subject_maxYearWorkDegree": subjectMaxYearWorkDegree,
        "subject_maxPracticalDegree": subjectMaxPracticalDegree,
        "subject_maxFinalDegree": subjectMaxFinalDegree,
        "subject_degree": subjectDegree,
        "subject_maxDegree": subjectMaxDegree,
        "subject_gpa": subjectGpa,
        "subject_hours": subjectHours,
        "subject_isCalculated": subjectIsCalculated == true ? 1 : 0,
        "subject_semester": subjectSemester,
        "subject_year": subjectYear,
      };
}
