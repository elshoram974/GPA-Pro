import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

enum StatusRequest {
  loading,
  success,
  failure,
  serverFailure,
  offlineFailure,
}

class NetHelper {
  // static ConnectivityResult checkNet = ConnectivityResult.none;

  // static Future<T?> doWhenInternetIsExist<T>(T Function() function) async {
  //   if (await _checkInternet()) {
  //     return function();
  //   } else {
  //     AppSnackBar.messageSnack(AppConstLang.noInternet.tr);
  //     _checkInternetStream(
  //       (ConnectivityResult result) async {
  //         if (result != ConnectivityResult.none) await doWhenInternetIsExist<T>(function);
  //       },
  //     );
  //     return null;
  //   }
  // }

  static Future<bool> checkInternet() async {
    try {
      final ConnectivityResult _ = await (Connectivity().checkConnectivity());

      return await _check(_);
    } catch (e) {
      return false;
    }
  }

  static Future<bool> _check(ConnectivityResult _) async {
    switch (_) {
      case ConnectivityResult.none:
        return false;
      default:
        try {
          List<InternetAddress> result =
              await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
          return false;
        } on SocketException {
          return false;
        }
    }
  }

  static StreamSubscription<ConnectivityResult> checkInternetStream(
    void Function(ConnectivityResult)? function,
  ) {
    return Connectivity().onConnectivityChanged.listen(function);
  }
}
