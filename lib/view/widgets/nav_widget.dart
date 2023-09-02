import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/routes.dart';
import 'package:flutter/material.dart';

class MyNavWidget extends StatelessWidget {
  const MyNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: AppInjections.mainScreenImp.homeNavigatorKey,
      onGenerateRoute: GeneratedRoute.onGenerateRoute,
    );
  }
}
