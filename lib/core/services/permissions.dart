import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class AppPermissions {
  static Future<void> _general(Permission permission) async {
    PermissionStatus status = await permission.status;
    if (status.isDenied) {
      status = await permission.request();
      if (!status.isGranted) {
        CustomDialog.simple(
          middleText: AppConstLang.uHaveToGivePermission.tr,
          textConfirm: AppConstLang.openAppSettings.tr,
          onConfirm: () async => await openAppSettings(),
        );
      }
    }
  }

  static Future<void> storage() => _general(Permission.storage);
  static Future<void> camera() => _general(Permission.camera);

  static Future<void> all() async {
    // await camera();
    await storage();
  }
}
