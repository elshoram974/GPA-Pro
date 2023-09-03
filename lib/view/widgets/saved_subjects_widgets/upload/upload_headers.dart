import 'package:gpa_pro/controller/saved_subjects_controllers/upload_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/validator.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_fields/default_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadHeaderPart extends StatelessWidget {
  const UploadHeaderPart({super.key});

  @override
  Widget build(BuildContext context) {
    UploadSavedTxtFileImp _ = Get.find<UploadSavedTxtFileImp>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: SelectableText.rich(
            TextSpan(
              text: "${AppConstLang.numberOfSubjects.tr}:- ".tr,
              style: context.textTheme.bodyLarge,
              children: [
                TextSpan(
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  text: "${_.subjectsList.length}",
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 2 * AppConstant.kDefaultPadding),
        SizedBox(
          width: 300,
          child: MyDefaultField(
            fieldKey: _.fieldKey,
            controller: _.degreeController,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (val) => _.changeSubjectsDegree(),
            isDouble: true,
            labelText: AppConstLang.degree.tr,
            validator: (value) => AppValidator.validInput(
              value,
              1,
              10,
              ValidType.degree,
              maxVal: 100,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _.changeSubjectsDegree,
          child: Text(AppConstLang.makeAllSubjectsWithThisDegree.tr),
        ),
        const SizedBox(height: AppConstant.kDefaultPadding / 2),
        const Divider(),
        const SizedBox(height: 2 * AppConstant.kDefaultPadding),
      ],
    );
  }
}
