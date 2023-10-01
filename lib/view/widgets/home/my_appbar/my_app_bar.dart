import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/view/screens/home/search_screen.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/popup_button.dart/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSelected;
  final int selectedLength;
  final bool isAllSelected;
  final void Function(bool) selectAllOrDeselect;
  final List<SubjectModel> selectedSubjects;
  final void Function() remove;
  final void Function()? changeSelectedCalc;
  final List<Widget>? moreActions;
  final PageType pageType;
  const MyAppBar({
    super.key,
    required this.title,
    required this.isSelected,
    required this.selectedLength,
    required this.isAllSelected,
    required this.selectAllOrDeselect,
    required this.remove,
    this.changeSelectedCalc,
    this.moreActions,
    required this.pageType,
    required this.selectedSubjects,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        isSelected
            ? "${AppConstLang.select.tr} $selectedLength ${AppConstLang.item.tr}"
            : title,
      ),
      leading: isSelected
          ? IconButton(
              onPressed: () => selectAllOrDeselect(false),
              icon: const Icon(Icons.arrow_back),
            )
          : null,
      actions: isSelected
          ? [
              IconButton(
                tooltip: isAllSelected
                    ? AppConstLang.deselect.tr
                    : AppConstLang.selectAll.tr,
                onPressed: () => isAllSelected
                    ? selectAllOrDeselect(false)
                    : selectAllOrDeselect(true),
                icon: Icon(
                  isAllSelected ? Icons.deselect : Icons.select_all,
                ),
              ),
              IconButton(
                tooltip: AppConstLang.delete.tr,
                onPressed: remove,
                icon: const Icon(Icons.delete),
              ),
              Visibility(
                visible: AppInjections.mainScreenImp
                    .popupList(pageType, true)
                    .isNotEmpty,
                child: MyPopupMenuButton(
                  showWhenSelected: true,
                  isSelected: isSelected,
                  pageType: pageType,
                  f: changeSelectedCalc,
                  subjectsToSave: selectedSubjects,
                ),
              ),
            ]
          : [
              Visibility(
                visible: pageType == PageType.homeScreen,
                child: IconButton(
                  onPressed: () {
                    showSearch<void>(
                      context: context,
                      delegate: SearchScreen(),
                    );
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
              if (moreActions != null) ...moreActions!,
              Visibility(
                visible: AppInjections.mainScreenImp
                    .popupList(pageType, false)
                    .isNotEmpty,
                child: MyPopupMenuButton(
                  pageType: pageType,
                  showWhenSelected: false,
                  isSelected: isSelected,
                  subjectsToSave: AppInjections.homeController.subjects,
                ),
              ),
              const SizedBox(width: 10),
            ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
