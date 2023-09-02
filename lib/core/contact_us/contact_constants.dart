import 'package:gpa_pro/core/constants/app_info.dart';

class ContactConstants {
  static const String userLinkedIn = "mohammed-elshora-096923231";
  static const String userFaceBook = "mohammed.alshora.1";
  static const String userGmail = "mre9743@gmail.com";
  static const String userTwitter = "mohammedriyad44";
  static const String userTelegram = "mre974";
  static const String myPhoneNumber = "+201553668845";

  static const String linkedInUrl = "https://www.linkedin.com/in/$userLinkedIn";
  static const String facebookUrl = "https://www.facebook.com/$userFaceBook";
  static const String gmailUrl =
      "mailto:$userGmail?subject=${AppInfo.appName}&body=&";
  static const String twitterUrl = "https://twitter.com/$userTwitter";
  static const String telegramUrl = "https://t.me/$userTelegram";
  static const String whatsAppUrl = "https://wa.me/$myPhoneNumber";
  static const String phoneCall = "tel:$myPhoneNumber";
  static const String sms = "sms:$myPhoneNumber";
}

enum Launch {
  linkedIn,
  facebook,
  gmail,
  twitter,
  telegram,
  whatsApp,
  phoneCall,
  sms,
  other,
}
