import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/contact_us_privacy_bttn_widget.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/info_collection_widget.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/privacy_pieces_widget.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/service_providers_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SelectableText(AppConstLang.privacyPolicy.tr)),
      body: CustomBodyListView(
        children: [
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium!,
              children: [
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.privacyPolicy.tr,
                    AppConstLang.privacyPolicy1.tr,
                  ),
                ),
                const WidgetSpan(child: InformationCollectionAndUse()),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.logData.tr,
                    AppConstLang.logData1.tr,
                  ),
                ),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.cookies.tr,
                    AppConstLang.cookies1.tr,
                  ),
                ),
                const WidgetSpan(child: ServiceProviders()),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.security.tr,
                    AppConstLang.security1.tr,
                  ),
                ),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.linksToOtherSites.tr,
                    AppConstLang.linksToOtherSites1.tr,
                  ),
                ),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.childrenPrivacy.tr,
                    AppConstLang.childrenPrivacy1.tr,
                  ),
                ),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.changesToThisPrivacyPolicy.tr,
                    AppConstLang.changesToThisPrivacyPolicy1.tr,
                  ),
                ),
                WidgetSpan(
                  child: PrivacyPieceTextSpan(
                    AppConstLang.contactUs.tr,
                    AppConstLang.contactUs1.tr,
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
