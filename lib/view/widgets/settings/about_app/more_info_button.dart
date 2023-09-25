// import 'package:gpa_pro/core/constants/app_info.dart';
// import 'package:gpa_pro/core/constants/public_constant.dart';
// import 'package:gpa_pro/core/localization/lang_constant.dart';
// import 'package:gpa_pro/core/shared/app_icon.dart';
// import 'package:gpa_pro/core/shared/custom_list_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MoreInfo extends StatelessWidget {
//   const MoreInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 2 * AppConstant.kDefaultPadding),
//         const Divider(),
//         CustomListTile(
//           title: AppConstLang.moreInfo.tr,
//           subtitle:
//               "${AppConstLang.pressHereToSee.tr} ${AppConstLang.moreInfo.tr}",
//           leadingIcon: Icons.info_outline,
//           onTap: () {
//             showAboutDialog(
//               context: context,
//               applicationIcon: const AppIcon(),
//               applicationLegalese: AppInfo.appLegalese,
//               applicationName: AppInfo.appName,
//               applicationVersion: AppInfo.appVersion,
//             );
//           },
//         )
//       ],
//     );
//   }
// }
