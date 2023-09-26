import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';

class UserListTile extends StatelessWidget {
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final Widget? leadingWidget;
  final EdgeInsetsGeometry? contentPadding;
  final String title;
  final String? subtitle;
  final bool noFunction;
  final bool miniIcon;
  final void Function()? onTap;

  const UserListTile({
    Key? key,
    this.trailingIcon,
    this.leadingWidget,
    required this.title,
    this.onTap,
    this.leadingIcon,
    this.subtitle,
    this.contentPadding,
    this.noFunction = false,
    this.miniIcon = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppConstant.kDefaultPadding),
      child: CustomListTile(
        title: title,
        subtitle: subtitle,
        leadingIcon: leadingIcon,
        leadingWidget: leadingWidget,
        onTap: onTap,
        contentPadding: contentPadding,
        miniIcon: miniIcon,
        noFunction: noFunction,
        trailingIcon: trailingIcon,
        textColor: Colors.black,
        tileColor: Colors.grey.shade200,
      ),
    );
  }
}
