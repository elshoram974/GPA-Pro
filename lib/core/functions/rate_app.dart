// import 'package:gpa_pro/core/constants/app_info.dart';
// import 'package:gpa_pro/core/constants/public_constant.dart';
// import 'package:gpa_pro/core/localization/lang_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rate_my_app/rate_my_app.dart';

// class RateApp {
//   // In this snippet, I'm giving a value to all parameters.
// // Please note that not all are required (those that are required are marked with the @required annotation).

//   static final RateMyApp _rateMyApp = RateMyApp(
//     preferencesPrefix: 'rateMyApp_',
//     minDays: 2,
//     minLaunches: 5,
//     remindDays: 4,
//     remindLaunches: 5,
//     googlePlayIdentifier: AppInfo.appId,
//     appStoreIdentifier: AppInfo.appleStoreId,
//   );

//   static void rateApp(BuildContext context) {
//     // Get.defaultDialog<T>(
//     //   buttonColor: AppColor.primary,
//     //   confirmTextColor: Colors.white,
//     //   title: title,
//     //   titleStyle: title == '' ? const TextStyle(fontSize: 0) : null,
//     //   middleText: middleText,
//     //   textConfirm: textConfirm,
//     //   textCancel: textCancel,
//     //   onConfirm: onConfirm == null
//     //       ? null
//     //       : () {
//     //           Get.back();
//     //           onConfirm();
//     //         },
//     //   onCancel: onCancel,
//     //   titlePadding: title == '' ? EdgeInsets.zero : null,
//     // );

//     if (AppConstant.isAndroidOrIOS) {
//       _rateMyApp.init().then(
//         (_) {
//           if (_rateMyApp.shouldOpenDialog) {
//             _rateMyApp.showRateDialog(
//               context,
//               title: AppConstLang.rateThisApp.tr, // The dialog title.
//               message: AppConstLang.rateMessage.tr, // The dialog message.
//               rateButton:
//                   AppConstLang.rate.tr, // The dialog "rate" button text.
//               noButton:
//                   AppConstLang.noThanks.tr, // The dialog "no" button text.
//               laterButton:
//                   AppConstLang.maybeLater.tr, // The dialog "later" button text.
//               // listener: (button) {
//               //   // The button click listener (useful if you want to cancel the click event).
//               //   // switch (button) {
//               //   //   case RateMyAppDialogButton.rate:
//               //   //     print('Clicked on "Rate".');
//               //   //     break;
//               //   //   case RateMyAppDialogButton.later:
//               //   //     print('Clicked on "Later".');
//               //   //     break;
//               //   //   case RateMyAppDialogButton.no:
//               //   //     print('Clicked on "No".');
//               //   //     break;
//               //   // }

//               //   return true; // Return false if you want to cancel the click event.
//               // },
//               dialogStyle: const DialogStyle(), // Custom dialog styles.
//               onDismissed: () =>
//                   _rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
//             );
//           }
//         },
//       );
//     }
//   }
// }
