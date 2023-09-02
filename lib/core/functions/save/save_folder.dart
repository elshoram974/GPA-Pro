import 'dart:io';

import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/saved_constants.dart';
import 'package:gpa_pro/core/services/permissions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

class SaveFolder {
  static void waitToSaveDialog() {
    Get.dialog(
      const SimpleDialog(
        children: [
          SizedBox.square(
            child: Center(child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }

  static Future<String> saveTxt(String fileName, String fileContent) async {
    String directory = AppSavedConst.phoneDownloadDir;
    if (AppConstant.isDesktop) {
      directory = (await getDownloadsDirectory())!.path;
      directory = directory.replaceAll(r"\", "/");
    }
    String folderName = AppSavedConst.folderName;
    final folderDirectory = Directory('$directory/$folderName');

    if (!(await folderDirectory.exists())) {
      await folderDirectory.create(recursive: true);
    }

    String filePath = '${folderDirectory.path}/$fileName M_R_E.txt';

    File file = File(filePath);
    int i = 1;
    while (await file.exists()) {
      filePath = '${folderDirectory.path}/$fileName M_R_E $i.txt';
      file = File(filePath);
      i++;
    }

    await AppPermissions.storage();
    if (AppConstant.isDesktop) {
      await file.writeAsString(fileContent); // حفظ الملف
      Process.runSync('attrib', ['+R', file.path]);
    } else {
      await file.writeAsString(fileContent); // حفظ الملف
      Process.runSync('chmod', ['444', filePath]);
    }

    return filePath; // إرجاع المسار النهائي للملف المحفوظ
  }

  static Future<String> savePDF(String fileName, Uint8List bytes) async {
    String directory = AppSavedConst.phoneDownloadDir;
    if (AppConstant.isDesktop) {
      directory = (await getDownloadsDirectory())!.path;
      directory = directory.replaceAll(r"\", "/");
    }
    String folderName = AppSavedConst.folderName;
    final Directory folderDirectory = Directory('$directory/$folderName');

    if (!(await folderDirectory.exists())) {
      await folderDirectory.create(recursive: true);
    }

    String filePath = '${folderDirectory.path}/$fileName M_R_E .PDF';

    File file = File(filePath);

    int i = 1;
    while (await file.exists()) {
      i++;
      filePath = '${folderDirectory.path}/$fileName M_R_E $i.PDF';
      file = File(filePath);
    }

    await AppPermissions.storage();
    await file.writeAsBytes(bytes);

    return file.path;
  }
}
