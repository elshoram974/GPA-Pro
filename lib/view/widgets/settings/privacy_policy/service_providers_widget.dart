import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/dash_line_widget.dart';
import 'package:gpa_pro/view/widgets/settings/privacy_policy/privacy_pieces_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceProviders extends StatelessWidget {
  const ServiceProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        style: Theme.of(context).textTheme.bodyMedium!,
        children: [
          WidgetSpan(
            child: PrivacyPieceTextSpan(
              AppConstLang.serviceProviders.tr,
              AppConstLang.serviceProviders1.tr,
            ),
          ),
          dashLine(context, AppConstLang.serviceProviders2.tr),
          dashLine(context, AppConstLang.serviceProviders3.tr),
          dashLine(context, AppConstLang.serviceProviders4.tr),
          dashLine(context, AppConstLang.serviceProviders5.tr),
          WidgetSpan(
            child: PrivacyPieceTextSpan(
              '',
              AppConstLang.serviceProviders6.tr,
            ),
          )
        ],
      ),
      textScaleFactor: MediaQuery.textScaleFactorOf(context),
    );
  }
}
