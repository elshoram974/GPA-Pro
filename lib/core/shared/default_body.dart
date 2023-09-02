import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/shared/gpa_bar/gpa_bar.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    super.key,
    this.onWillPop,
    this.appBar,
    required this.addIsAvailable,
    this.onPressedFloatingButton,
    required this.tooltipFloatingButton,
    this.body,
    required this.modelList,
    this.isEmptyBody = false,
    this.textWhenEmptyBody = "empty",
    required this.pageType,
    this.realizedHours,
    this.allSubjects,
  });
  final Future<bool> Function()? onWillPop;
  final PreferredSizeWidget? appBar;
  final bool addIsAvailable;
  final bool isEmptyBody;
  final String textWhenEmptyBody;
  final void Function()? onPressedFloatingButton;
  final String tooltipFloatingButton;
  final Widget? body;
  final List<ParentModel> modelList;
  final PageType pageType;
  final int? realizedHours;
  final List<SubjectModel>? allSubjects;

  @override
  Widget build(BuildContext context) {
    GPAFunctionsHelper modelFunctions = GPAFunctionsHelper(modelList);
    return WillPopScope(
      onWillPop: onWillPop,
      child: SelectionArea(
        child: Scaffold(
          appBar: appBar,
          floatingActionButton: addIsAvailable
              ? FloatingActionButton(
                  onPressed: onPressedFloatingButton,
                  tooltip: tooltipFloatingButton,
                  child: const Icon(Icons.add_outlined),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.endContained,
          extendBody: true,
          body: isEmptyBody
              ? Center(
                  child: Text(
                    textWhenEmptyBody,
                    style: context.textTheme.headlineMedium,
                  ),
                )
              : body,
          bottomNavigationBar: CustomBottomBar(
            modelFunctions: modelFunctions,
            addIsAvailable: addIsAvailable,
            arguments: DetailsArguments(
              color: modelFunctions.color(context, inList: false),
              modelList: modelList,
              pageType: pageType,
              realizedHours: realizedHours,
              moreSubjects: allSubjects,
            ),
          ),
        ),
      ),
    );
  }
}
