import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_constants.dart';

class LaunchHelper {
  static void lunchApp({required Launch contactWay, String otherLink = ''}) {
    if (contactWay != Launch.other) Get.back();

    switch (contactWay) {
      case Launch.linkedIn:
        _launch(ContactConstants.linkedInUrl);
        break;
      case Launch.gmail:
        _launch(ContactConstants.gmailUrl);
        break;
      case Launch.facebook:
        _launch(ContactConstants.facebookUrl);
        break;
      case Launch.twitter:
        _launch(ContactConstants.twitterUrl);
        break;
      case Launch.telegram:
        _launch(ContactConstants.telegramUrl);
        break;
      case Launch.whatsApp:
        _launch(ContactConstants.whatsAppUrl);
        break;
      case Launch.phoneCall:
        _launch(ContactConstants.phoneCall);
        break;
      case Launch.sms:
        _launch(ContactConstants.sms);
        break;

      default:
        _launch(otherLink);

      // showSnackBar("error".tr);
      // break;
    }
  }

  static void _launch(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      bool opened = false;
      opened = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalNonBrowserApplication,
      );
      if (!opened) {
        try {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        } catch (e) {
          AppSnackBar.messageSnack(AppConstLang.notAvailableInThisDevice.tr);
        }
      }
    } else {
      try {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } catch (e) {
        AppSnackBar.messageSnack(AppConstLang.notAvailableInThisDevice.tr);
      }
    }
  }
}
