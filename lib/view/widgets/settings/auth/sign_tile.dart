import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/data/datasource/remote/auth/login.dart';
import 'package:gpa_pro/data/model/user.dart';
import 'package:gpa_pro/view/widgets/settings/auth/photo_list_tile.dart';
import 'package:gpa_pro/view/widgets/settings/auth/user_tile_info.dart';

class SignTile extends StatelessWidget {
  const SignTile({super.key});

  @override
  Widget build(BuildContext context) {
    UserData? userData = LoginRemotely.savedLogin();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstant.kDefaultPadding),
        child: Row(
          children: [
            PhotoListTile(userData),
            Expanded(child: UserTileInfo(userData)),
          ],
        ),
      ),
    );
  }
}
