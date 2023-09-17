import 'package:gpa_pro/core/constants/injections.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/shared_keys.dart';
import 'package:gpa_pro/data/datasource/remote/subjects/synchronization.dart';

class CustomBodyListView extends StatelessWidget {
  final List<Widget> children;
  final bool canSync;
  const CustomBodyListView({
    super.key,
    required this.children,
    this.canSync = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: canSync && AppInjections.myServices.sharedPreferences.containsKey(SharedKeys.userData),
      replacement: myListView(),
      child: RefreshIndicator(
        onRefresh: Synchronization().synchronizationSubjects,
        child: myListView(),
      ),
    );
  }

  ListView myListView() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
      shrinkWrap: true,
      children: children,
    );
  }
}
