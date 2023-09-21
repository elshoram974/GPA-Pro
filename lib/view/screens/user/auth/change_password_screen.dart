import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/widgets/user/auth/auth_structure.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Get.arguments['user'];
    return AuthScreenStructure(body: Text(user.toJson().toString()));
  }
}
