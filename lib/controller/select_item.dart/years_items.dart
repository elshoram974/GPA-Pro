import 'package:gpa_pro/data/model/year_model.dart';
import 'package:get/get.dart';

abstract class SelectedYearController extends GetxController {
  List<YearModel> yearsList = [];
  List<YearModel> selectedList = [];

  bool isSelected = false;
  bool isAllSelected = false;

  //--------------------------------onTap---------------------------------------

  void _selectOnTap(int selectedIndex) {
    yearsList[selectedIndex].isSelected = !yearsList[selectedIndex].isSelected;

    if (yearsList[selectedIndex].isSelected) {
      selectedList.add(yearsList[selectedIndex]);
    } else {
      selectedList.remove(yearsList[selectedIndex]);
    }

    if (selectedList.length == yearsList.length) {
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
    selectedList.addAllIf(isSelected, yearsList);

    for (YearModel e in yearsList) {
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
