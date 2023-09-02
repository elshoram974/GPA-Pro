import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/view/screens/home/add_screen.dart';
import 'package:gpa_pro/view/screens/saved_subjects_screens/pdf_screen.dart';
import 'package:gpa_pro/view/screens/settings/privacy_policy_screen.dart';
import 'package:gpa_pro/view/screens/saved_subjects_screens/upload_screen.dart';
import 'package:gpa_pro/view/screens/home/year_screen.dart';
import 'package:gpa_pro/view/screens/initialize/edit_grades_screen.dart';
import 'package:gpa_pro/view/screens/settings/about_app_screen.dart';
import 'package:gpa_pro/view/screens/main_screen.dart';
import 'package:gpa_pro/view/screens/home/semester_screen.dart';
import 'package:gpa_pro/view/screens/home/subject_screen.dart';
import 'package:gpa_pro/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneratedRoute {
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: AppRoute.mainScreen, page: () => const MainScreen()),
    GetPage(name: AppRoute.aboutApp, page: () => const AboutAppScreen()),
    GetPage(name: AppRoute.privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: AppRoute.editGrades, page: () => const EditGradesScreen()),
    GetPage(name: AppRoute.addScreen, page: () => const AddScreen()),
    GetPage(name: AppRoute.uploadScreen, page: () => const UploadScreen()),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.pdf:
        return myPageRouteBuilder(
          settings: settings,
          child: const PDFScreen(),
        );
      case AppRoute.year:
        return myPageRouteBuilder(
          settings: settings,
          child: const YearScreen(),
        );
      case AppRoute.semester:
        return myPageRouteBuilder(
          settings: settings,
          child: const SemesterScreen(),
        );
      case AppRoute.subject:
        return myPageRouteBuilder(
          settings: settings,
          child: const SubjectScreen(),
        );
      default:
        return myPageRouteBuilder(
          settings: settings,
          child: const HomeScreen(),
        );
    }
  }

  static PageRouteBuilder<dynamic> myPageRouteBuilder({
    required RouteSettings settings,
    required Widget child,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(
          begin: Offset(AppInjections.locale.isArabicLang ? 1 : -1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
      settings: settings,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
