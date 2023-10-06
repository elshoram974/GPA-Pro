import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';

class PasswordController extends GetxController {
  bool _hidePass = true;
  bool _hideRePass = true;

  bool hidePass(isRePass) => isRePass ? _hideRePass : _hidePass;

  void changeHidePass(bool isRePass) {
    if (isRePass) {
      _hideRePass = !_hideRePass;
    } else {
      _hidePass = !_hidePass;
    }
    update();
  }
}

class DefaultPassWidget extends StatelessWidget {
  const DefaultPassWidget({
    super.key,
    this.newValid = false,
    this.isRePass = false,
    this.changeTextColorToBlack = true,
    this.minChar,
    this.fieldKey,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
    this.validator, this.onEditingComplete,
  });
  final bool newValid;
  final int? minChar;
  final bool isRePass;
  final bool changeTextColorToBlack;
  final GlobalKey<FormFieldState<dynamic>>? fieldKey;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordController>(
      init: PasswordController(),
      builder: (_) {
        return MyDefaultField(
          fieldKey: fieldKey,
          onEditingComplete:onEditingComplete,
          autofillHints: const [AutofillHints.password],
          textDirection: TextDirection.ltr,
          textInputAction: textInputAction,
          textColor: changeTextColorToBlack ? Colors.black : null,
          textCapitalization: TextCapitalization.none,
          textAlign: TextAlign.left,
          labelText:
              isRePass ? AppConstLang.rePassword.tr : AppConstLang.password.tr,
          keyboardType: TextInputType.visiblePassword,
          onChanged: onChanged,
          validator: newValid || validator != null
              ? validator
              : (value) => AppValidator.validInputAuth(
                    value,
                    minChar ?? 0,
                    100,
                    AuthValidType.password,
                  ),
          obscureText: _.hidePass(isRePass),
          onFieldSubmitted: onFieldSubmitted,
          suffix: IconButton(
            onPressed: () => _.changeHidePass(isRePass),
            icon: Icon(
              _.hidePass(isRePass)
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        );
      },
    );
  }
}
