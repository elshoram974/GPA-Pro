import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/gpa_bar/gpa_bar_body.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final GPAFunctionsHelper modelFunctions;
  final bool addIsAvailable;
  final DetailsArguments arguments;
  const CustomBottomBar({
    super.key,
    required this.modelFunctions,
    this.addIsAvailable = true,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: AppConstant.gpaBarHight - 10,
        margin: addIsAvailable
            ? EdgeInsets.only(
                top: AppConstant.kDefaultPadding / 2,
                bottom: AppConstant.kDefaultPadding / 2,
                right: AppInjections.locale
                    .retAr<double>(AppConstant.kDefaultPadding / 2, 82),
                left: AppInjections.locale
                    .retAr<double>(82, AppConstant.kDefaultPadding / 2),
              )
            :const EdgeInsets.all(AppConstant.kDefaultPadding / 2),
        alignment: Alignment.center,
        child: GPABarBody(
          modelFunctions: modelFunctions,
          arguments: arguments,
        ),
      ),
    );
  }
}
