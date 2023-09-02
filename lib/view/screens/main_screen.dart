import 'package:gpa_pro/core/ads/widgets/banner_ads.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/view/widgets/main_screen/body.dart';
import 'package:gpa_pro/view/widgets/main_screen/desktop_view.dart';
import 'package:gpa_pro/view/widgets/main_screen/navigation_bar/bottom_nav_bar.dart';
import 'package:gpa_pro/view/widgets/main_screen/tablet_view.dart';
import 'package:gpa_pro/core/shared/layout_builder.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppInjections.mainScreenImp.onWillPop,
      child: const SelectionArea(
        child: Scaffold(
          appBar: BannerAdsAppBar(),
          body: Responsive(
            phone: MainBody(),
            tablet: TabletHomeView(),
            desktop: DesktopHomeView(),
          ),
          bottomNavigationBar: MyBottomNavBar(),
        ),
      ),
    );
  }
}
