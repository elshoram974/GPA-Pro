import 'dart:convert';

class User {
  final String status;
  final UserData data;

  User({
    required this.status,
    required this.data,
  });

  User copyWith({
    String? status,
    UserData? data,
  }) =>
      User(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class UserData {
  final int? userId;
  final String? message;
  final String email;
  final String firstName;
  final String lastName;
  late final String completeName;
  final String password;
  final String? userImage;
  final int? verifiedCode;
  final bool isVerified;
  final bool approvedAds;
  final DateTime? userCreateAt;
  final DateTime? lastLogin;
  final String? userSharedId;

  UserData({
    this.userId,
    this.message,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.userImage,
    this.verifiedCode,
    this.isVerified = false,
    this.approvedAds = false,
    this.userCreateAt,
    this.lastLogin,
    this.userSharedId,
  }){
    completeName = "$firstName $lastName";
  }

  UserData copyWith({
    int? userId,
    String? message,
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? userImage,
    int? verifiedCode,
    bool? isVerified,
    bool? approvedAds,
    DateTime? userCreateAt,
    DateTime? lastLogin,
    String? userSharedId,
  }) =>
      UserData(
        userId: userId ?? this.userId,
        message: message ?? this.message,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        userImage: userImage ?? this.userImage,
        verifiedCode: verifiedCode ?? this.verifiedCode,
        isVerified: isVerified ?? this.isVerified,
        approvedAds: approvedAds ?? this.approvedAds,
        userCreateAt: userCreateAt ?? this.userCreateAt,
        lastLogin: lastLogin ?? this.lastLogin,
        userSharedId: userSharedId ?? this.userSharedId,
      );

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["user_id"],
        message: json["message"],
        email: json["email"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        password: json["password"] ?? '',
        userImage: json["user_image"],
        verifiedCode: json["verified_code"],
        isVerified: json["is_verified"] == 1 ? true : false,
        approvedAds: json["approved_ads"] == 0 ? false : true,
        userCreateAt: json["user_create_at"] == null
            ? null
            : DateTime.parse(json["user_create_at"]),
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        userSharedId: json["user_sharedId"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "message": message,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "user_image": userImage,
        "verified_code": verifiedCode,
        "is_verified": isVerified ? 1 : 0,
        "approved_ads": approvedAds ? 1 : 0,
        "user_create_at": userCreateAt?.toIso8601String(),
        "last_login": lastLogin?.toIso8601String(),
        "user_sharedId": userSharedId,
      };
}
