import 'package:gpa_pro/data/model/semester_model.dart';
import 'package:get/get.dart';

abstract class SelectedSemestersController extends GetxController {
  List<SemesterModel> semesterList = [];
  List<SemesterModel> selectedList = [];

  bool isSelected = false;
  bool isAllSelected = false;

  //--------------------------------onTap---------------------------------------

  void _selectOnTap(int selectedIndex) {
    semesterList[selectedIndex].isSelected =
        !semesterList[selectedIndex].isSelected;

    if (semesterList[selectedIndex].isSelected) {
      selectedList.add(semesterList[selectedIndex]);
    } else {
      selectedList.remove(semesterList[selectedIndex]);
    }

    if (selectedList.length == semesterList.length) {
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
    selectedList.addAllIf(isSelected, semesterList);

    for (SemesterModel e in semesterList) {
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
