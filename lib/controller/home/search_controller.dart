import 'package:gpa_pro/controller/home/subject_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/subject_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:get/get.dart';

abstract class SearchController extends GetxController {
  void init();

  void onSelectCalculateChip(bool value);

  void search(String query);

  ParentModel getModel(int index);

  void onTap(int index);

  bool get isEmptySearch;
  bool get isNoSavedSubjects;
  bool get notFound;

  int get subjectsLength;
  int get filteredLength;
  int get length;
}

class SearchControllerImp extends SearchController {
  bool isNotCalculate = false;

  String myQuery = "";

  final List<SubjectModel> subjects = [];
  List<SubjectModel> filteredSubjects = [];

  final List<SubjectModel> allSubjects = [];

  late final SubjectHelper helper;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void init() async {
    helper = SubjectHelper(allSubjects);
    allSubjects.addAll(await AppInjections.homeController.getSubjects());
    update();
  }

  @override
  void onSelectCalculateChip(bool value) {
    isNotCalculate = value;
    update();
  }

  @override
  void search(String query) {
    myQuery = query;
    subjects.clear();
    filteredSubjects.clear();
    if (isNotCalculate) {
      subjects.addAll(helper.getCalculated(false));
      filteredSubjects.addAll(helper.searchCalcSubjectByName(query, false));
    } else {
      filteredSubjects.addAll(helper.searchSubjectByName(query));
      subjects.addAll(allSubjects);
    }
  }

  @override
  ParentModel getModel(int index) {
    return isEmptySearch ? subjects[index] : filteredSubjects[index];
  }

  @override
  void onTap(int index) {
    Get.lazyPut<SubjectControllerImp>(() => SubjectControllerImp());
    AppInjections.mainScreenImp.homeNavigatorKey.currentState!.pushNamed(
      AppRoute.subject,
      arguments: PageArgument(
        model: getModel(index),
        fromPage: PageType.searchScreen,
      ),
    );
  }

  @override
  bool get isEmptySearch => myQuery.trim() == "";

  @override
  bool get isNoSavedSubjects => allSubjects.isEmpty;

  @override
  bool get notFound => !isEmptySearch && filteredSubjects.isEmpty;

  @override
  int get subjectsLength => subjects.length;
  @override
  int get filteredLength => filteredSubjects.length;

  @override
  int get length => isEmptySearch ? subjectsLength : filteredLength;
}
