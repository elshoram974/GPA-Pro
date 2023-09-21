import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Color? tileColor;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final EdgeInsetsGeometry? contentPadding;
  final String title;
  final String? subtitle;
  final bool noFunction;
  final bool miniIcon;
  final void Function()? onTap;

  const CustomListTile({
    Key? key,
    this.trailingIcon,
    required this.title,
    this.onTap,
    this.leadingIcon,
    this.subtitle,
    this.contentPadding,
    this.noFunction = false,
    this.miniIcon = false, this.tileColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
      ),
      contentPadding: contentPadding,
      trailing: trailingIcon == null ? null : Icon(trailingIcon),
      leading: leadingIcon == null
          ? null
          : Icon(leadingIcon, size: miniIcon ? 17 : null),
      title: Text(title, overflow: TextOverflow.ellipsis),
      subtitle: subtitle == null ? null : Text(subtitle!),
      onTap: noFunction
          ? null
          : () {
              if (onTap != null) onTap!();
            },
    );
  }
}
