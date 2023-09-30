import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';

enum PageType {
  addScreen,
  shareScreen,
  searchScreen,
  subjectScreen,
  semesterScreen,
  yearScreen,
  homeScreen,
}

class AddArgument {
  final String title;
  final ModelType fromPageWithModelType;
  final ParentModel? thisModel;
  const AddArgument({
    required this.title,
    this.thisModel,
    required this.fromPageWithModelType,
  });
}

class UploadArguments {
  final String title;
  final List<SubjectModel> newSubjects;
  const UploadArguments({
    required this.title,
    required this.newSubjects,
  });
}

class PageArgument {
  final PageType fromPage;
  final ParentModel model;
  const PageArgument({required this.model, required this.fromPage});
}

class DetailsArguments {
  final PageType pageType;
  final int? realizedHours;
  final Color? color;
  final List<SubjectModel>? moreSubjects;
  final List<ParentModel> modelList;
  const DetailsArguments({
    required this.color,
    this.moreSubjects,
    this.realizedHours,
    required this.modelList,
    required this.pageType,
  });
}
