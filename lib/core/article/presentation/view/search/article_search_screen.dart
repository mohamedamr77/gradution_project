import 'package:flutter/material.dart';

import 'article_search_body.dart';

class ArticleSearchScreen extends StatelessWidget {
  static String id = "article_search_screen";
  const ArticleSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ArticleSearchBody(),
    );
  }
}
