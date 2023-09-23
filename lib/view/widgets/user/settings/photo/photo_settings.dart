import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/account_settings_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/widgets/settings/auth/photo_list_tile.dart';
import 'package:gpa_pro/view/widgets/user/settings/photo/change_button.dart';

class PhotoSettings extends StatelessWidget {
  const PhotoSettings({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GetBuilder<AccountSettingControllerImp>(builder: (_) {
      UserData? savedUser = LoginRemotely.savedLogin();

      return Align(
        child: Container(
          width: 0.5 * size.shortestSide,
          height: 0.5 * size.shortestSide,
          constraints: const BoxConstraints(
            minWidth: 100,
            minHeight: 100,
            maxWidth: 400,
            maxHeight: 400,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.2),
            borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
          ),
          child: Stack(
            children: [
              PhotoListTile(
                0.5 * size.shortestSide,
                _.user,
                withOutRounded: true,
              ),
              ChangeButton(hasPhoto: savedUser?.userImage != null),
            ],
          ),
        ),
      );
    });
  }
}
