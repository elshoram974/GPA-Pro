import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/add_details/add_details_body.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/home_details/home_details_body.dart';
import 'package:gpa_pro/view/widgets/home/details_screen_widgets/other/other_details_body.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.arguments});
  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    switch (arguments.pageType) {
      case PageType.addScreen:
        return AddDetailsBody(arguments: arguments);
      case PageType.homeScreen:
        return HomeDetailsBody(arguments: arguments);

      default:
        return OtherDetailsBody(arguments: arguments);
    }
  }
}
