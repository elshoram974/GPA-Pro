import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String? value;
  final String hint;
  final bool enabled;
  final List<String> items;
  const CustomDropDownButton({
    super.key,
    this.onChanged,
    this.value,
    required this.items,
    required this.hint,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: SizedBox(
        height: 40,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            margin:const EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black45),
            ),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(30),
              hint: Text(hint),
              alignment: Alignment.center,
              items: [
                ...List.generate(
                  items.length,
                  (index) => DropdownMenuItem<String>(
                    enabled: enabled,
                    value: items[index],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(items[index].tr),
                    ),
                  ),
                ),
              ],
              onChanged: onChanged,
              value: value,
            ),
          ),
        ),
      ),
    );
  }
}
