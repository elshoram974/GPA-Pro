import 'package:gpa_pro/core/constants/injections.dart';
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

  List<SubjectModel> _getSimilarSubjects(SubjectModel query) {
    final List<SubjectModel> searchedSubjects = [];
    for (SubjectModel subject in subjectsList) {
      if (subject.remoteId != null &&
          subject.remoteId != null &&
          subject.remoteId == query.remoteId) searchedSubjects.add(subject);
      // if (subject.isAllEqual(query)) searchedSubjects.add(subject);
    }
    return searchedSubjects;
  }

  List<SubjectModel> getSubjectsFromDataBaseThatNotHere(
    List<SubjectModel> otherSubjects,
  ) {
    List<SubjectModel> differenceSubjects = [];

    for (SubjectModel e in otherSubjects) {
      List<SubjectModel> temp = [];
      temp.addAll(_getSimilarSubjects(e));
      if (temp.isEmpty) differenceSubjects.add(e);
    }

    return differenceSubjects;
  }

  List<SubjectModel> makeAllSubjectsNotSelected() {
    List<SubjectModel> temp = [];

    for (SubjectModel e in subjectsList) {
      temp.add(e..isSelected = false);
    }

    return temp;
  }

  List<SubjectModel> makeAllSubjectsNeedSyncOrNot(bool makeAllNeedSync) {
    List<SubjectModel> temp = [];

    for (SubjectModel e in subjectsList) {
      temp.add(e..isNeedSync = makeAllNeedSync);
    }

    return temp;
  }

  List<SubjectModel> makeAllSubjectsWithNullRemoteId() {
    List<SubjectModel> temp = [];

    for (SubjectModel e in subjectsList) {
      temp.add(e..remoteId = null);
    }

    return temp;
  }

  List<SubjectModel> getAllSubjectsNeedSync() {
    List<SubjectModel> temp = [];

    for (SubjectModel e in subjectsList) {
      if (e.isNeedSync == true) temp.add(e);
    }

    return temp;
  }

  List<SubjectModel> makeSubjectsThatNullRemoteToNeedSync() {
    List<SubjectModel> temp = [];

    for (SubjectModel e in subjectsList) {
      if (e.remoteId == null) temp.add(e..isNeedSync = true);
    }

    return temp;
  }

  bool isSubjectHere(SubjectModel subject) {
    for (var e in subjectsList) {
      if (e.isSubjectEqual(subject)) return true;
    }
    return false;
  }

  List<SubjectModel> getThereRemoteId() {
    List<SubjectModel> temp = [];

    for (SubjectModel e in AppInjections.homeController.subjects) {
      if (isSubjectHere(e)) temp.add(e);
    }

    return temp;
  }
}
