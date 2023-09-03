import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/colors.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: AppColor.secondary,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}