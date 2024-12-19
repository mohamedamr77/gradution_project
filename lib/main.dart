import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradutionproject/core/utils/const_variables.dart';

void main (){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        wd = constraints.maxWidth;
        ht = constraints.maxHeight;
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
      );
      },

    );
  }
}
