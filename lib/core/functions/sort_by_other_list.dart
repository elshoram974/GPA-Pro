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
