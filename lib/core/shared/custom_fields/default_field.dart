import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';

class MyDefaultField extends StatelessWidget {
  final GlobalKey<FormFieldState>? fieldKey;
  final String? labelText;
  final String? initialValue;
  final bool isDouble;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final int? maxLines;
  final int? minLines;
  final TextAlignVertical? textAlignVertical;
  final double? horizontalPadding;
  final double verticalPadding;
  final bool? alignLabelWithHint;
  final TextCapitalization textCapitalization;
  final void Function(String)? onFieldSubmitted;
  const MyDefaultField({
    super.key,
    this.labelText,
    this.controller,
    this.isDouble = false,
    this.onChanged,
    this.onSaved,
    this.textAlign = TextAlign.center,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.textDirection,
    this.maxLines = 1,
    this.minLines,
    this.horizontalPadding,
    this.verticalPadding = 0.0,
    this.textAlignVertical = TextAlignVertical.center,
    this.alignLabelWithHint,
    this.textCapitalization = TextCapitalization.words,
    this.fieldKey,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstant.kDefaultPadding / 2),
      child: TextFormField(
        decoration: InputDecoration(
          errorMaxLines: 10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
          ),
          alignLabelWithHint: alignLabelWithHint,
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? AppConstant.kDefaultPadding / 2,
            vertical: verticalPadding,
          ),
        ),
        textDirection: textDirection,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        initialValue: initialValue,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: isDouble ? TextInputType.number : TextInputType.text,
        key: fieldKey,
        onChanged: onChanged,
        textCapitalization: textCapitalization,
        textAlignVertical: textAlignVertical,
        onSaved: onSaved,
        validator: validator,
        textAlign: textAlign,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
