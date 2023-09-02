import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/controller/initialize/initialize_controller.dart';
import 'package:gpa_pro/core/localization/controller/locale_controller.dart';
import 'package:gpa_pro/core/services/services.dart';
import 'package:gpa_pro/core/theme/controller/mode_controller.dart';
import 'package:gpa_pro/controller/main_screen_controller.dart';
import 'package:get/get.dart';

abstract class AppInjections {
  static ModeController themeMode = Get.find<ModeController>();
  static LocaleControllerImp locale = Get.find<LocaleControllerImp>();
  static MyServices myServices = Get.find<MyServices>();

  // static GradeControllerImp gradeTable = Get.find<GradeControllerImp>();
  static InitializeControllerImp initialize =
      Get.find<InitializeControllerImp>();
  static MainScreenControllerImp mainScreenImp =
      Get.find<MainScreenControllerImp>();
  static HomeControllerImp homeController = Get.find<HomeControllerImp>();
}
