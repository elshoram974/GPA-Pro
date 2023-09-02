import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    super.key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= AppDimension.maxPhone) {
          return phone;
        } else if (constraints.maxWidth <= AppDimension.maxTablet) {
          return tablet;
        }

        return desktop;
      },
    );
  }
}

class ResponsiveInMaxWidth extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget desktop;
  const ResponsiveInMaxWidth({
    super.key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width <= AppDimension.maxPhone) {
      return phone;
    } else if (width <= AppDimension.maxTablet) {
      return tablet;
    }

    return desktop;
  }
}
