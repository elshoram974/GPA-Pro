import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key, required this.address});
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppConstant.kDefaultPadding),
        Text(address),
        const Divider(),
        const SizedBox(height: AppConstant.kDefaultPadding),
      ],
    );
  }
}
