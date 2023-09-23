import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contact_constants.dart';

class ContactUsModel {
  final Launch lunch;
  final IconData icon;
  final String name;
  const ContactUsModel({
    required this.lunch,
    required this.icon,
    required this.name,
  });
}

class ContactUsData {
  static List<ContactUsModel> get contactUsList => [
        // ContactUsModel(
        //   lunch: Launch.linkedIn,
        //   icon: FontAwesome.linkedin,
        //   name: AppConstLang.linkedin.tr,
        // ),
        // ContactUsModel(
        //   lunch: Launch.facebook,
        //   icon: FontAwesome.facebook,
        //   name: AppConstLang.facebook.tr,
        // ),
        ContactUsModel(
          lunch: Launch.gmail,
          icon: Icons.mail_outline,
          name: AppConstLang.gmail.tr,
        ),
        // ContactUsModel(
        //   lunch: Launch.twitter,
        //   icon: FontAwesome.twitter,
        //   name: AppConstLang.twitter.tr,
        // ),
        // ContactUsModel(
        //   lunch: Launch.telegram,
        //   icon: FontAwesome.telegram,
        //   name: AppConstLang.telegram.tr,
        // ),
        ContactUsModel(
          lunch: Launch.whatsApp,
          icon: FontAwesomeIcons.whatsapp,
          name: AppConstLang.whatsapp.tr,
        ),
        ContactUsModel(
          lunch: Launch.phoneCall,
          icon: Icons.call_outlined,
          name: AppConstLang.phone.tr,
        ),
        const ContactUsModel(
          lunch: Launch.sms,
          icon: FontAwesomeIcons.message,
          name: "SMS",
        ),
      ];
}
