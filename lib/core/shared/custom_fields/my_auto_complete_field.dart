import 'dart:async';

import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class MyAutoCompleteField<T> extends StatelessWidget {
  const MyAutoCompleteField({
    super.key,
    this.labelText,
    this.controller,
    this.isDouble = false,
    this.onChanged,
    this.textAlign = TextAlign.center,
    this.textDirection,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    required this.suggestionsCallback,
    required this.onSuggestionSelected,
    required this.itemBuilder,
    this.validator,
    this.initialValue,
    this.onSaved,
  });
  final String? initialValue;
  final String? labelText;
  final bool isDouble;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final FutureOr<Iterable<T>> Function(String) suggestionsCallback;
  final void Function(Object? suggestion) onSuggestionSelected;
  final Widget Function(BuildContext fieldContext, Object? suggestion)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstant.kDefaultPadding / 2),
      child: TypeAheadFormField<T>(
        hideOnError: true,
        animationDuration: const Duration(milliseconds: 600),
        key: key,
        initialValue: initialValue,
        itemBuilder: itemBuilder,
        onSuggestionSelected: onSuggestionSelected,
        suggestionsCallback: suggestionsCallback,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onSaved: onSaved,
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          constraints: const BoxConstraints(maxHeight: 300),
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
        ),
        textFieldConfiguration: TextFieldConfiguration(
          textDirection: textDirection,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
            ),
            labelText: labelText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppConstant.kDefaultPadding / 2,
            ),
          ),
          maxLength: maxLength,
          controller: controller,
          keyboardType: isDouble ? TextInputType.number : TextInputType.text,
          onChanged: onChanged,
          textCapitalization: TextCapitalization.words,
          textAlignVertical: TextAlignVertical.center,
          textAlign: textAlign,
          textInputAction: textInputAction,
        ),
      ),
    );
  }
}
