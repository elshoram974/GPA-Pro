enum ModelType { subject, semester, year }

class ParentModel {
  int id;
  final int hours;
  final double gpa;
  late double totalGPA;
  final double degree;
  final double maxDegree;
  double? percentageDegree;
  final String name;
  final String address;
  bool isCalculated;
  bool isSelected;
  bool isNeedSync;

  ParentModel({
    required this.maxDegree,
    this.percentageDegree,
    required this.gpa,
    required this.id,
    required this.name,
    required this.degree,
    required this.hours,
    this.address = "",
    this.isSelected = false,
    this.isNeedSync = true,
    this.isCalculated = true,
  }) {
    totalGPA = gpa * hours;
    percentageDegree = (100 * (degree / maxDegree));
  }
  factory ParentModel.init() => ParentModel(
        id: 0,
        name: "name",
        degree: 0.0,
        maxDegree: 0.0,
        hours: 0,
        gpa: 0.0,
      );
}
