import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'medicines_buttons.dart';
import 'medicines_list_items.dart';

class MedicinesBody extends StatelessWidget {
  const MedicinesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.04.w, vertical: 0.02.h),
      child: const CustomScrollView(
        slivers: [
          MedicinesButtons(),
          SliverToBoxAdapter(child: SizedBox(height: 16,)),
          MedicinesListItems(),
        ],
      ),
    );
  }
}