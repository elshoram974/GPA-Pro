import 'package:gpa_pro/view/widgets/main_screen/body.dart';
import 'package:gpa_pro/view/widgets/main_screen/navigation_bar/desktop_nav.dart';
import 'package:flutter/material.dart';

class DesktopHomeView extends StatelessWidget {
  const DesktopHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        DesktopNavigationRail(),
        Expanded(child: MainBody()),
      ],
    );
  }
}
