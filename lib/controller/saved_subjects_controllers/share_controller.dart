import 'package:get/get.dart';
import 'package:gpa_pro/controller/select_item.dart/subjects_items.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/model/subject_model.dart';

abstract class ShareSubjects extends SelectedSubjectController {
  void getArguments(List<SubjectModel> argument);

  void linkButton();
  void removeSharedSubject();

  @override
  Future<bool> onWillPop();
}

class ShareSubjectsImp extends ShareSubjects {
  final List<SubjectModel> _deletedSubjects = [];

  SubjectModel? subjectModel;
  int index = 0;

  @override
  void getArguments(List<SubjectModel> argument) {
    subjectsList.clear();
    subjectsList.addAll(argument);
  }

  // ---------------------- linkButton ------------------------------------------------
  @override
  void linkButton() async {
    if (subjectsList.isNotEmpty) {
      await CustomDialog.warningDialog(AppConstLang.itWillBeSaved.tr);
      update();
    }
  }

  // -------------------- end save --------------------------------------------

  // ---------------------- remove added ---------------------------------------

  @override
  void removeSharedSubject() async {
    _deletedSubjects.clear();
    await CustomDialog.warningDialog(
      "${AppConstLang.areUSureUWanna.tr} ${AppConstLang.remove.tr} ${AppConstLang.thatSelected.tr}",
      closeBeforeFunction: true,
      onConfirm: () {
        for (SubjectModel e in selectedList) {
          subjectsList.remove(e);
          e.isSelected = false;
          _deletedSubjects.add(e);
        }
        selectAllOrDeselect(false);
      },
    );
  }

  // -------------------- end remove -------------------------------------------

  // -------------------- onWillPop --------------------------------------------

  @override
  Future<bool> onWillPop() async {
    // if (subjectsList.isNotEmpty) {
    //   // bool exit = false;

    //   await CustomDialog.cancelChanges(
    //     isCancel: false,
    //     onConfirm: _save,
    //     onCancel: () {
    //       Navigator.popUntil(Get.context!, (route) => route.isFirst);
    //     },
    //   );

    //   return false;
    // }
    // Navigator.popUntil(Get.context!, (route) => route.isFirst);
    return super.onWillPop();
  }

  // -------------------- end onWillPop ----------------------------------------
}
