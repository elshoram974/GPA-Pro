import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/terms-conditions/terms_constants.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/contact_us_privacy_bttn_widget.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/dash_line_widget.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/privacy_pieces_widget.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SelectableText(AppConstLang.termsConditions.tr)),
      body: CustomBodyListView(
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium!,
              children: [
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.termsConditions.tr,
                    AppConstLang.termsConditions1.tr,
                  ),
                ),
                dashLine(
                  context,
                  AppConstLang.informationCollectionAndUse2.tr,
                  TermsConstants.playServicesPolicyLink,
                ),
                dashLine(
                  context,
                  'AdMob',
                  TermsConstants.adMobPolicyLink,
                ),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.changesToThisTermsConditions.tr,
                    AppConstLang.changesToThisTermsConditions1.tr,
                  ),
                ),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.contactUs.tr,
                    AppConstLang.contactUsTerms.tr,
                    addInEnd: const WidgetSpan(child: ContactUsPrivacyButton()),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2 * AppConstant.kDefaultPadding),
        ],
      ),
    );
  }
}
