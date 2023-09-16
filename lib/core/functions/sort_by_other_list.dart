import 'package:gpa_pro/data/model/parent_model.dart';

Set<Object> sortListByOther(List<Object> sortedList, List<Object> listToSort) {
  Set<Object> temp = {};
  for (Object e in sortedList) {
    if (listToSort.contains(e)) {
      temp.add(e);
    }
  }
  temp.addAll(listToSort);
  return temp;
}

bool isNeedSyncList(List<ParentModel> modelList) {
  for (ParentModel e in modelList) {
    if (e.isNeedSync) return true;
  }
  return false;
}
