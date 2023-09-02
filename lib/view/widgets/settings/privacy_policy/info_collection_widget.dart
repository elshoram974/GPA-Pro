import 'package:gpa_pro/core/constants/privacy_policy/privacy_policy_constants.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/dash_line_widget.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/privacy_pieces_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationCollectionAndUse extends StatelessWidget {
  const InformationCollectionAndUse({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        style: Theme.of(context).textTheme.bodyMedium!,
        children: [
          WidgetSpan(
            child: PrivacyPieceTextSpan(
              AppConstLang.informationCollectionAndUse.tr,
              AppConstLang.informationCollectionAndUse1.tr,
            ),
          ),
          dashLine(
            context,
            AppConstLang.informationCollectionAndUse2.tr,
            PrivacyPolicyConstants.playServicesPolicyLink,
          ),
          dashLine(
            context,
            'AdMob',
            PrivacyPolicyConstants.adMobPolicyLink,
          )
        ],
      ),
      textScaleFactor: MediaQuery.textScaleFactorOf(context),
    );
  }
}
