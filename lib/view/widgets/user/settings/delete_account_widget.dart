import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({
    super.key,
    this.fieldKey,
    this.onChanged,
    this.onFieldSubmitted,
  });
  final GlobalKey<FormFieldState<dynamic>>? fieldKey;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    double maxHeight = 0.287 * MediaQuery.sizeOf(context).height;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstant.kDefaultPadding,
          vertical: AppConstant.kDefaultPadding / 2,
        ),
        child: Column(
          children: [
            Text(
              LoginRemotely.savedLogin()!.email.toLowerCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: AppConstant.kDefaultPadding),
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodySmall,
                text: "${AppConstLang.deleteMessage.tr}\n\n",
                children: [
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    text: AppConstLang.deleteConfirm.tr,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2 * AppConstant.kDefaultPadding),
            MyDefaultField(
              fieldKey: fieldKey,
              textAlign: TextAlign.start,
              onChanged: onChanged,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: onFieldSubmitted,
              validator: (value) =>
                  AppValidator.validInputAuth(value, 0, 25, AuthValidType.name),
            ),
          ],
        ),
      ),
    );
  }
}
