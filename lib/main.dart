import 'package:gpa_pro/core/constants/app_info.dart';
import 'package:gpa_pro/core/localization/controller/locale_controller.dart';
import 'package:gpa_pro/core/localization/translation.dart';
import 'package:gpa_pro/core/theme/controller/mode_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gpa_pro/bindings/initial_bindings.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/services/services.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/theme/app_theme.dart';
import 'package:gpa_pro/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initialServices();

  runApp(const GPAProApp());
}

class GPAProApp extends StatelessWidget {
  const GPAProApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<ModeController>(ModeController());
    Get.put<LocaleControllerImp>(LocaleControllerImp());

    return GetMaterialApp(
      title: AppInfo.appName,
      initialRoute: AppRoute.mainScreen,
      locale: AppInjections.locale.currentLocale,
      themeMode: AppInjections.themeMode.savedMode,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      translations: MyLocal(),
      initialBinding: InitialBindings(),
      getPages: GeneratedRoute.getPages,
    );
  }
}
