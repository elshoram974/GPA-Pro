import 'package:gpa_pro/core/ads/class/interstitial_ads.dart';
import 'package:gpa_pro/core/ads/class/rewarded_interstitial_ads.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/popup_model.dart';
import 'package:gpa_pro/core/class/subjects/shared_subjects.dart';
import 'package:gpa_pro/core/class/subjects/subject_helper.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/core/functions/after_open_app.dart';
import 'package:gpa_pro/core/functions/my_bottom_sheets.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/class/body_model.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/synchronization.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/view/screens/initialize/initialize_screen.dart';
import 'package:gpa_pro/view/screens/settings/settings_screen.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/popup_button.dart/open_saved_bottom_sheets.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/popup_button.dart/save_bottom_sheet.dart';
import 'package:gpa_pro/view/widgets/nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'saved_subjects_controllers/share_controller.dart';

abstract class MainScreenController extends GetxController {
  List<Body> get homePages;
  void changeBody(int newIndex);
  Future<bool> onWillPop();
}

class MainScreenControllerImp extends MainScreenController {
  // put it in controller to refresh when the lang is changed

  late TextEditingController textSelection;
  late FocusNode textFocus;
  @override
  void onClose() {
    textFocus.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    textFocus = FocusNode();
  }

  @override
  void onReady() {
    super.onReady();
    AfterOpen.onOpen();
  }

  @override
  List<Body> get homePages => [
        Body(
          id: 0,
          label: AppConstLang.initialize.tr,
          icon: Icons.menu_outlined,
          body: const InitialScreen(),
        ),
        Body(
          id: 1,
          label: AppConstLang.home.tr,
          icon: Icons.home_outlined,
          body: const MyNavWidget(),
        ),
        Body(
          id: 2,
          label: AppConstLang.settings.tr,
          icon: Icons.settings_outlined,
          body: const SettingsScreen(),
        ),
      ];

  final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey();

  // ---------------------------------------------------------

  int index = 1;

  @override
  void changeBody(int newIndex) async {
    assert(newIndex < homePages.length && newIndex >= 0);
    index = newIndex;

    if (index == 1) {
      while (homeNavigatorKey.currentState?.canPop() ?? false) {
        homeNavigatorKey.currentState!.pop();
      }
    }
    AppInjections.homeController.onWillPop();

    update();
  }

  // ---------------------------------------------------------

  DateTime _timeBackPressed = DateTime.now();
  @override
  Future<bool> onWillPop() async {
    if (index != 1) {
      changeBody(1);
      return false;
    }

    // pop on year screen
    if (await homeNavigatorKey.currentState!.maybePop()) return false;

    final Duration difference = DateTime.now().difference(_timeBackPressed);
    if (difference <= const Duration(seconds: 2)) {
      return true;
    }

    AppSnackBar.exitSnackBar();

    _timeBackPressed = DateTime.now();
    return false;
  }

  // popup button -------------------------------------------------------
  List<PopupMenuEntry<PopupButton>> popupList(
    PageType inPage,
    bool showWhenSelected,
  ) {
    List<PopupMenuEntry<PopupButton>> temp = [];
    for (PopupModel e in _popupList) {
      if (e.inPages.contains(inPage) &&
          e.showWhenSelected == showWhenSelected) {
        temp.add(e.popupMenuItem());
      }
    }
    return temp;
  }

  void onSelected(
    PopupButton value,
    void Function()? f,
    List<SubjectModel> subjectsToSave,
    bool showPDF,
    bool isSelected,
  ) async {
    switch (value) {
      case PopupButton.convertSubjects:
        f!();
        break;
      case PopupButton.openSavedFile:
        AppBottomSheets.customSheet(const OpenSavedBottomModelSheet());
        break;
      case PopupButton.share:
        SharedSubjectsHelper shared = SharedSubjectsHelper();
        List<SubjectModel>? sharedSubject;
        if (isSelected) {
          sharedSubject = await shared.share(subjectsToSave);
        } else {
          sharedSubject = await shared.getMyShared();
        }
        if (sharedSubject != null) {
          Get.lazyPut<ShareSubjectsControllerImp>(
              () => ShareSubjectsControllerImp());
          Get.toNamed(
            AppRoute.shareScreen,
            arguments: SubjectHelper(sharedSubject)
                .makeAllSubjectsNeedSyncOrNot(false),
          );
          InterstitialAdsHelper.showAd();
        }
        break;
      case PopupButton.sync:
        await Synchronization().synchronizationSubjects();
        break;
      case PopupButton.saveFile:
        await RewardedInterstitialAdsHelper.showAd();
        AppBottomSheets.customSheet(
          SaveBottomModelSheet(
            subjectsToSave: subjectsToSave,
            showPDF: showPDF,
          ),
        );
        break;
      default:
    }
  }

  List<PopupModel> get _popupList {
    bool isLoggedIn = AppInjections.myServices.sharedPreferences
        .containsKey(SharedKeys.userData);
    return [
      PopupModel(
        inPages: [
          PageType.homeScreen,
          PageType.yearScreen,
          PageType.semesterScreen,
          PageType.addScreen,
        ],
        showWhenSelected: true,
        value: PopupButton.convertSubjects,
        text: AppConstLang.calculatedOrNot.tr,
      ),
      PopupModel(
        inPages: [PageType.homeScreen],
        enabled: isLoggedIn,
        value: PopupButton.share,
        text: AppConstLang.openSharedScreen.tr,
      ),
      PopupModel(
        inPages: [PageType.homeScreen],
        value: PopupButton.openSavedFile,
        text: AppConstLang.openSavedFiles.tr,
      ),
      PopupModel(
        inPages: [PageType.homeScreen],
        enabled: AppInjections.homeController.subjects.isNotEmpty,
        value: PopupButton.saveFile,
        text: AppConstLang.saveFile.tr,
      ),
      PopupModel(
        inPages: [
          PageType.homeScreen,
          PageType.yearScreen,
          PageType.semesterScreen,
        ],
        showWhenSelected: true,
        enabled: AppInjections.homeController.subjects.isNotEmpty,
        value: PopupButton.saveFile,
        text: AppConstLang.saveFile.tr,
      ),
      PopupModel(
        inPages: [
          PageType.homeScreen,
          PageType.yearScreen,
          PageType.semesterScreen,
        ],
        showWhenSelected: true,
        enabled: AppInjections.homeController.subjects.isNotEmpty && isLoggedIn,
        value: PopupButton.share,
        text: AppConstLang.share.tr,
      ),
      PopupModel(
        inPages: [
          PageType.homeScreen,
          PageType.yearScreen,
          PageType.semesterScreen
        ],
        enabled: isLoggedIn,
        value: PopupButton.sync,
        text: AppConstLang.sync.tr,
      ),
    ];
  }
}
