import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/select_item.dart/subjects_items.dart';
// import 'package:gpa_pro/core/ads/class/rewarded_interstitial_ads.dart';
import 'package:gpa_pro/core/class/subjects/shared_subjects.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/data/model/user.dart';

abstract class ShareSubjectsController extends SelectedSubjectController {
  void getArguments(List<SubjectModel> argument);

  void linkButton();
  void removeSharedSubject();
}

class ShareSubjectsControllerImp extends ShareSubjectsController {
  SubjectModel? subjectModel;
  int index = 0;

  @override
  void getArguments(List<SubjectModel> argument) {
    subjectsList.clear();
    subjectsList.addAll(argument);
  }

  // ---------------------- linkButton ------------------------------------------------
  @override
  void linkButton() async {
    if (subjectsList.isNotEmpty) {
      UserData user = LoginRemotely.savedLogin()!;
      // bool watchAd = await RewardedInterstitialAdsHelper.showAd();
      // if (watchAd) _linkDialog('${AppLinks.shareLink}${user.userSharedId}');
      _linkDialog('${AppLinks.shareLink}${user.userSharedId}');
    }
  }

  Future<T?> _linkDialog<T>(String message) async {
    return await Get.defaultDialog<T>(
      buttonColor: AppColor.primary,
      confirmTextColor: Colors.white,
      title: AppConstLang.warning.tr,
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstant.kDefaultPadding,
          vertical: AppConstant.kDefaultPadding / 2,
        ),
        child: MyDefaultField(initialValue: message, readOnly: true),
      ),
      textConfirm: AppConstLang.copyToClipboard.tr,
      onConfirm: () async {
        await Clipboard.setData(ClipboardData(text: message));
        Get.back();
        AppSnackBar.messageSnack(AppConstLang.copied.tr);
      },
    );
  }

  // -------------------- end link --------------------------------------------

  // ---------------------- remove added ---------------------------------------

  @override
  void removeSharedSubject() async {
    await CustomDialog.warningDialog(
      "${AppConstLang.areUSureUWanna.tr} ${AppConstLang.remove.tr} ${AppConstLang.thatSelected.tr}",
      closeBeforeFunction: true,
      onConfirm: () async {
        bool deleted = await SharedSubjectsHelper().delete(selectedList);
        if (deleted) {
          for (SubjectModel e in selectedList) {
            subjectsList.remove(e);
          }
          selectAllOrDeselect(false);
          update();
        }
      },
    );
  }

  // -------------------- end remove -------------------------------------------
}
