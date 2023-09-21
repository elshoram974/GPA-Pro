import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/assets.dart';

class StaticImage extends StatelessWidget {
  const StaticImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.noProfilePic, fit: BoxFit.cover);
  }
}