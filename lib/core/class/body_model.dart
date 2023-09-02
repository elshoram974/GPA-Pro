import 'package:flutter/material.dart';

class Body {
  final int id;
  final String label;
  final IconData icon;
  final Widget body;

  const Body({
    required this.id,
    required this.label,
    required this.icon,
    required this.body,
  });
}
