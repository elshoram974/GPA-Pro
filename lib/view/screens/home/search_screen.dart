import 'package:gpa_pro/controller/home/search_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/home/search_screen_widgets/search_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends SearchDelegate {
  @override
  String? get searchFieldLabel => AppConstLang.search.tr;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.close),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => null;

  @override
  Widget buildResults(BuildContext context) => buildSuggestions(context);

  @override
  Widget buildSuggestions(BuildContext context) {
    Get.lazyPut<SearchControllerImp>(() => SearchControllerImp());

    return SearchBody(query: query);
  }
}
