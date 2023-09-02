import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:get/get.dart';

abstract class SelectedSubjectController extends GetxController {
  List<SubjectModel> subjectsList = [];
  List<SubjectModel> selectedList = [];

  bool isSelected = false;
  bool isAllSelected = false;

  //--------------------------------onTap---------------------------------------

  void _selectOnTap(int selectedIndex) {
    subjectsList[selectedIndex].isSelected =
        !subjectsList[selectedIndex].isSelected;

    if (subjectsList[selectedIndex].isSelected) {
      selectedList.add(subjectsList[selectedIndex]);
    } else {
      selectedList.remove(subjectsList[selectedIndex]);
    }

    if (selectedList.length == subjectsList.length) {
      selectAllOrDeselect(true);
    } else if (selectedList.isEmpty) {
      selectAllOrDeselect(false);
    } else {
      isAllSelected = false;
    }
    update();
  }

  void onTap(int selectedIndex) {
    if (isSelected) {
      _selectOnTap(selectedIndex);
    }
  }
  //----------------------------------------------------------------------------

  //------------------onLongPress---------------------------
  void onLongPress(int selectedIndex) {
    isSelected = true;
    onTap(selectedIndex);
  }
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------

  //------------------selectAllOrNot---------------------------
  void selectAllOrDeselect(bool isSelectedItem) {
    isSelected = isSelectedItem;

    isAllSelected = isSelected;

    selectedList = [];
    selectedList.addAllIf(isSelected, subjectsList);

    for (SubjectModel e in subjectsList) {
      e.isSelected = isSelected;
    }
    update();
  }
  //----------------------------------------------------------------------------

  int get selectedLength => selectedList.length;

  Future<bool> onWillPop() async {
    if (isSelected) {
      selectAllOrDeselect(false);
      return false;
    }
    return true;
  }
}
