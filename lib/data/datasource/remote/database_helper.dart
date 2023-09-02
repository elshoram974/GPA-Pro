import 'package:gpa_pro/data/datasource/remote/get_app_info.dart';

class CheckDataBase {
  static Future<void> init() async {
    await AppInfoRemotely.getInfo();
  }
}
