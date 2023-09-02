// import 'package:gpa_pro/core/localization/local_controller.dart';
// import 'package:gpa_pro/core/theme/mode_controller.dart';
import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/controller/initialize/initialize_controller.dart';
import 'package:gpa_pro/controller/main_screen_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<InitializeControllerImp>(InitializeControllerImp());
    Get.put<MainScreenControllerImp>(MainScreenControllerImp());
    Get.put<HomeControllerImp>(HomeControllerImp());
  }
}
