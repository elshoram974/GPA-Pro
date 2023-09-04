import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/colors.dart';

class AuthScreenPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColor.primary.withOpacity(0.9);

    double h = size.height * 0.45;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - h);
    path.quadraticBezierTo(
      0.8 * size.width,
      size.height - h,
      0.6 * size.width,
      size.height - (2 * h / 3),
    );
    path.quadraticBezierTo(
      0.25 * size.width,
      size.height - 10,
      0,
      size.height - 10,
    );

    path.close();

    path.moveTo(0, 0);
    path.lineTo(0, h);
    path.quadraticBezierTo(0.2 * size.width, h, 0.4 * size.width, (2 * h / 3));
    path.quadraticBezierTo(0.75 * size.width, 10, size.width, 10);
    path.lineTo(size.width, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
