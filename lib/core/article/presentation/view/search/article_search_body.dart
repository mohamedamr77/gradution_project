import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gradutionproject/core/shared_widget/custom_text_form_field.dart';
import 'package:gradutionproject/core/utils/locale_keys.g.dart';

class ArticleSearchBody extends StatelessWidget {
  const ArticleSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomTextField(hintText: LocaleKeys.searchHere.tr(),
                title:""),
          ),

        ],
      ),
    );
  }
}
