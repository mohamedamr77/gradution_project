import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_app_bar.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';

import 'article_search_body.dart';

class ArticleSearchScreen extends StatelessWidget {
  static String id = "article_search_screen";
  const ArticleSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.search.tr()),
      body: const ArticleSearchBody(),
    );
  }
}
