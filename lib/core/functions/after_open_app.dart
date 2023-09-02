import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/functions/first_open.dart';
import 'package:gpa_pro/core/functions/rate_app.dart';
import 'package:gpa_pro/data/datasource/remote/database_helper.dart';

class AfterOpen {
  static void onOpen() async {
    CheckDataBase.init();

    FirstOpen.editGradesDialog();
    AppInjections.myServices.initUniLinks();

    RateApp.rateAppDialog();
    // NetHelper.checkInternetStream();
  }
}
