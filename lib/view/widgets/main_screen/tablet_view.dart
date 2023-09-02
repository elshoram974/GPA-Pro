import 'package:gpa_pro/view/widgets/main_screen/body.dart';
import 'package:gpa_pro/view/widgets/main_screen/navigation_bar/tablet_nav.dart';
import 'package:flutter/material.dart';

class TabletHomeView extends StatelessWidget {
  const TabletHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MyNavigationRail(),
        Expanded(child: MainBody()),
      ],
    );
  }
}
