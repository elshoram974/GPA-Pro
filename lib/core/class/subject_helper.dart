import 'package:gpa_pro/data/model/subject_model.dart';

class SubjectHelper {
  final List<SubjectModel> subjectsList;
  const SubjectHelper(this.subjectsList);

  List<SubjectModel> getCalculated(bool isCalc) {
    final List<SubjectModel> getCalcSubjects = [];

    for (SubjectModel subject in subjectsList) {
      if (subject.isCalculated == isCalc) getCalcSubjects.add(subject);
    }
    return getCalcSubjects;
  }

  Set<SubjectModel> searchSubjectByName(String query) {
    final Set<SubjectModel> searchedSubjects = {};

    for (SubjectModel subject in subjectsList) {
      if (subject.nameEn.toLowerCase().contains(query.toLowerCase().trim()) ||
          (subject.nameAr ?? '')
              .toLowerCase()
              .contains(query.toLowerCase().trim())) {
        searchedSubjects.add(subject);
      }
    }
    return searchedSubjects;
  }

  Set<SubjectModel> searchSubjectByAllName(String query) {
    final Set<SubjectModel> searchedSubjects = {};

    for (SubjectModel subject in subjectsList) {
      if (subject.nameEn.toLowerCase() == query.toLowerCase() ||
          (subject.nameAr ?? '').toLowerCase() == query.toLowerCase()) {
        searchedSubjects.add(subject);
      }
    }
    return searchedSubjects;
  }

  Set<SubjectModel> searchCalcSubjectByName(String query, bool isCalculated) {
    final Set<SubjectModel> searchedSubjects = {};
    final Set<SubjectModel> subjects = searchSubjectByName(query);
    for (SubjectModel subject in subjects) {
      if (subject.isCalculated == isCalculated) {
        searchedSubjects.add(subject);
      }
    }
    return searchedSubjects;
  }

  Set<SubjectModel> searchCalcSubjectByAllName(
      String query, bool isCalculated) {
    final Set<SubjectModel> searchedSubjects = {};
    final Set<SubjectModel> subjects = searchSubjectByAllName(query);
    for (SubjectModel subject in subjects) {
      if (subject.isCalculated == isCalculated) {
        searchedSubjects.add(subject);
      }
    }
    return searchedSubjects;
  }

  List<SubjectModel> searchByNameAddress(SubjectModel query) {
    final List<SubjectModel> searchedSubjects = [];
    for (SubjectModel subject in subjectsList) {
      if (subject.isEqualByNameAddress(query)) {
        searchedSubjects.add(subject);
      }
    }
    return searchedSubjects;
  }

  bool isSubjectsChanged(List<SubjectModel> otherList) {
    if (subjectsList.length != otherList.length) return true;

    for (int i = 0; i < subjectsList.length; i++) {
      if (!subjectsList[i].isAllEqual(otherList[i])) return true;
    }
    return false;
  }
  List<SubjectModel> getSimilarSubjects(SubjectModel query) {
    final List<SubjectModel> searchedSubjects = [];
    for (SubjectModel subject in subjectsList) {
      if (subject.isAllEqual(query)) {
        searchedSubjects.add(subject);
      }
    }
    return searchedSubjects;
  }

  List<SubjectModel> otherSubjectsThatNotHere(
    List<SubjectModel> otherSubjects,
  ) {
    List<SubjectModel> differenceSubjects = [];

    for (SubjectModel e in otherSubjects) {
      List<SubjectModel> temp = [];
      temp.addAll(getSimilarSubjects(e));
      if (temp.isEmpty) differenceSubjects.add(e);
    }

    return differenceSubjects;
  }
}
