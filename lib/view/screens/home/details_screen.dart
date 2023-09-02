import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  // final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    DetailsArguments arguments;
    arguments = ModalRoute.of(context)?.settings.arguments as DetailsArguments;

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: SelectionArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppConstLang.cumulativeDetails.tr),
            centerTitle: true,
            leading: const SizedBox(),
            leadingWidth: 0,
            backgroundColor: arguments.color,
          ),
          body: DetailsBody(arguments: arguments),
        ),
      ),
    );
  }
}
