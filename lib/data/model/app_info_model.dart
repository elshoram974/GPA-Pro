import 'dart:convert';

import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/contact_us/contact_constants.dart';
import 'package:gpa_pro/core/contact_us/contact_helper.dart';

class AppInfoModel {
  final String status;
  final AppInfoData data;

  AppInfoModel({
    required this.status,
    required this.data,
  });

  AppInfoModel copyWith({
    String? status,
    AppInfoData? data,
  }) =>
      AppInfoModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  // factory AppInfoModel.fromRawJson(String str) =>
  //     AppInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppInfoModel.fromJson(Map<String, dynamic> json) => AppInfoModel(
        status: json["status"],
        data: AppInfoData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class AppInfoData {
  final int? id;
  final String? appId;
  final String? appleStoreId;
  final String? microsoftStoreId;
  final int? buildVersion;
  final String? version;
  final String? messageTitleEn;
  final String? messageTitleAr;
  final String? updateDialogMessageEn;
  final String? updateDialogMessageAr;
  final String? whenPressUpdateAndroid;
  final String? whenPressUpdateIos;
  final String? whenPressUpdateWindows;
  final String? whenPressUpdateMac;
  final String? whenPressUpdateLinux;
  final String? whenPressUpdateWeb;
  final bool? shouldUpdateOnly;
  final String? privacyPolicyLink;
  final String? appLegalese;
  final String? message;

  AppInfoData({
    this.id,
    this.appId,
    this.appleStoreId,
    this.microsoftStoreId,
    this.buildVersion,
    this.version,
    this.messageTitleEn,
    this.messageTitleAr,
    this.updateDialogMessageEn,
    this.updateDialogMessageAr,
    this.whenPressUpdateAndroid,
    this.whenPressUpdateIos,
    this.whenPressUpdateWindows,
    this.whenPressUpdateMac,
    this.whenPressUpdateLinux,
    this.whenPressUpdateWeb,
    this.shouldUpdateOnly,
    this.privacyPolicyLink,
    this.appLegalese,
    this.message,
  });

  AppInfoData copyWith({
    int? id,
    String? appId,
    String? appleStoreId,
    String? microsoftStoreId,
    int? buildVersion,
    String? version,
    String? messageTitleEn,
    String? messageTitleAr,
    String? updateDialogMessageEn,
    String? updateDialogMessageAr,
    String? whenPressUpdateAndroid,
    String? whenPressUpdateIos,
    String? whenPressUpdateWindows,
    String? whenPressUpdateMac,
    String? whenPressUpdateLinux,
    String? whenPressUpdateWeb,
    bool? shouldUpdateOnly,
    String? privacyPolicyLink,
    String? appLegalese,
    String? message,
  }) =>
      AppInfoData(
        id: id ?? this.id,
        appId: appId ?? this.appId,
        appleStoreId: appleStoreId ?? this.appleStoreId,
        microsoftStoreId: microsoftStoreId ?? this.microsoftStoreId,
        buildVersion: buildVersion ?? this.buildVersion,
        version: version ?? this.version,
        messageTitleEn: messageTitleEn ?? this.messageTitleEn,
        messageTitleAr: messageTitleAr ?? this.messageTitleAr,
        updateDialogMessageEn:
            updateDialogMessageEn ?? this.updateDialogMessageEn,
        updateDialogMessageAr:
            updateDialogMessageAr ?? this.updateDialogMessageAr,
        whenPressUpdateAndroid:
            whenPressUpdateAndroid ?? this.whenPressUpdateAndroid,
        whenPressUpdateIos: whenPressUpdateIos ?? this.whenPressUpdateIos,
        whenPressUpdateWindows:
            whenPressUpdateWindows ?? this.whenPressUpdateWindows,
        whenPressUpdateMac: whenPressUpdateMac ?? this.whenPressUpdateMac,
        whenPressUpdateLinux: whenPressUpdateLinux ?? this.whenPressUpdateLinux,
        whenPressUpdateWeb: whenPressUpdateWeb ?? this.whenPressUpdateWeb,
        shouldUpdateOnly: shouldUpdateOnly ?? this.shouldUpdateOnly,
        privacyPolicyLink: privacyPolicyLink ?? this.privacyPolicyLink,
        appLegalese: appLegalese ?? this.appLegalese,
        message: message ?? this.message,
      );

  // factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  void whenPressUpdate() {
    LaunchHelper.lunchApp(
      contactWay: Launch.other,
      otherLink: (AppConstant.isAndroid
              ? whenPressUpdateAndroid
              : AppConstant.isIOS
                  ? whenPressUpdateIos
                  : AppConstant.isWindows
                      ? whenPressUpdateWindows
                      : AppConstant.isMacOS
                          ? whenPressUpdateMac
                          : AppConstant.isLinux
                              ? whenPressUpdateLinux
                              : whenPressUpdateWeb) ??
          '',
    );
  }

  factory AppInfoData.fromJson(Map<String, dynamic> json) => AppInfoData(
        id: json["id"],
        appId: json["appId"],
        appleStoreId: json["appleStoreId"],
        microsoftStoreId: json["microsoftStoreId"],
        buildVersion: json["buildVersion"],
        version: json["version"],
        messageTitleEn: json["messageTitleEn"],
        messageTitleAr: json["messageTitleAr"],
        updateDialogMessageEn: json["updateDialogMessageEN"],
        updateDialogMessageAr: json["updateDialogMessageAR"],
        whenPressUpdateAndroid: json["whenPressUpdateAndroid"],
        whenPressUpdateIos: json["whenPressUpdateIos"],
        whenPressUpdateWindows: json["whenPressUpdateWindows"],
        whenPressUpdateMac: json["whenPressUpdateMac"],
        whenPressUpdateLinux: json["whenPressUpdateLinux"],
        whenPressUpdateWeb: json["whenPressUpdateWeb"],
        shouldUpdateOnly: json["shouldUpdateOnly"] == 1 ? true : false,
        privacyPolicyLink: json["privacyPolicyLink"],
        appLegalese: json["appLegalese"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "appId": appId,
        "appleStoreId": appleStoreId,
        "microsoftStoreId": microsoftStoreId,
        "buildVersion": buildVersion,
        "version": version,
        "messageTitleEn": messageTitleEn,
        "messageTitleAr": messageTitleAr,
        "updateDialogMessageEN": updateDialogMessageEn,
        "updateDialogMessageAR": updateDialogMessageAr,
        "whenPressUpdateAndroid": whenPressUpdateAndroid,
        "whenPressUpdateIos": whenPressUpdateIos,
        "whenPressUpdateWindows": whenPressUpdateWindows,
        "whenPressUpdateMac": whenPressUpdateMac,
        "whenPressUpdateLinux": whenPressUpdateLinux,
        "whenPressUpdateWeb": whenPressUpdateWeb,
        "shouldUpdateOnly": shouldUpdateOnly == true ? 1 : 0,
        "privacyPolicyLink": privacyPolicyLink,
        "appLegalese": appLegalese,
        "message": message,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
