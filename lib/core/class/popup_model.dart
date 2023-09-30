import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:flutter/material.dart';

enum PopupButton {
  convertSubjects,
  openSavedFile,
  saveFile,
  share,
  sync,
}

class PopupModel {
  final bool enabled;
  final bool showWhenSelected;
  final List<PageType> inPages;
  final PopupButton value;
  final String text;

  const PopupModel({
    this.showWhenSelected = false,
    this.enabled = true,
    required this.inPages,
    required this.value,
    required this.text,
  });
  PopupMenuEntry<PopupButton> popupMenuItem() {
    return PopupMenuItem<PopupButton>(
      enabled: enabled,
      value: value,
      child: Text(text),
    );
  }
}
