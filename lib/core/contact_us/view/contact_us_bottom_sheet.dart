import 'package:gpa_pro/core/contact_us/model/model_and_data.dart';
import 'package:gpa_pro/core/shared/custom_bottom_sheet.dart';
import 'package:gpa_pro/core/shared/custom_grid_view.dart';
import 'package:flutter/material.dart';

import '../contact_helper.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyBottomModelSheet(
      widgets: [
        MyGridView(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount:
              MediaQuery.sizeOf(context).width < 500 ? 2 : 4, // change here
          widgets: List.generate(
            ContactUsData.contactUsList.length,
            (i) {
              ContactUsModel model = ContactUsData.contactUsList[i];
              return IconButton(
                onPressed: () => LaunchHelper.lunchApp(contactWay: model.lunch),
                icon: Icon(model.icon),
                tooltip: model.name,
              );
            },
          ),
        )
      ],
    );
  }
}
