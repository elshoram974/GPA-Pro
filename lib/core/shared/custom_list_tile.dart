import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Color? tileColor;
  final Color? textColor;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final Widget? leadingWidget;
  final EdgeInsetsGeometry? contentPadding;
  final String title;
  final String? subtitle;
  final bool noFunction;
  final bool miniIcon;
  final void Function()? onTap;

  const CustomListTile({
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
    this.tileColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
      ),
      contentPadding: contentPadding,
      trailing: trailingIcon == null ? null : Icon(trailingIcon),
      leading: leadingWidget ??
          (leadingIcon == null
              ? null
              : Icon(leadingIcon, size: miniIcon ? 17 : null)),
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
