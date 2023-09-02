enum CellFieldType { grade, degree, gpa, color }

class CellFieldModel {
  // TextEditingController? controller;
  // FocusNode? focusNodes;
  int column;
  int cellIndex;
  CellFieldType? cellFieldType;

  CellFieldModel({
    // this.controller,
    // this.focusNodes,
    required this.column,
    required this.cellIndex,
    this.cellFieldType,
  });

  factory CellFieldModel.getNewEmpty() => CellFieldModel(
        cellIndex: 0,
        column: 0,
      );
}
