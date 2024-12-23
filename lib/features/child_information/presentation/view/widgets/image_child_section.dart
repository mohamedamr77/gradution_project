import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/core/shared_widget/global_text.dart';
import 'package:gradutionproject/core/utils/app_colors.dart';
import 'package:gradutionproject/core/utils/app_icons.dart';
import 'package:gradutionproject/core/utils/app_text.dart';
import 'package:gradutionproject/core/utils/extentions/screen_size.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_information_state.dart';
import 'package:gradutionproject/features/child_information/presentation/view_model/child_informtion_cubit.dart';
import 'package:image_picker/image_picker.dart';

class ImageChildSection extends StatefulWidget {
  const ImageChildSection({super.key});

  @override
  State<ImageChildSection> createState() => _ImageChildSectionState();
}

class _ImageChildSectionState extends State<ImageChildSection> {
  XFile? myPhoto;
  final ImagePicker picker = ImagePicker();

  Future<XFile?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    var cubit =BlocProvider.of<ChildInformationCubit>(context);
    return BlocConsumer<ChildInformationCubit, ChildInformationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (BuildContext context, ChildInformationState state) {
        return Column(
          children: [
            InkWell(
              onTap: (){
                pickImage().then((value) {
                  if (value != null) {
                    File imageFile = File(value.path);
                    cubit.setPhoto(imageFile);
                  } else {
                    // Show a toast if the user cancels the image selection

                  }

                });
              },

              child: CircleAvatar(
                radius: 0.13.w,
                backgroundColor: AppColors.grayColor,
                child:
                cubit.image == null
                    ?
                AppIcons.cameraIcon :
                CircleAvatar(
                    radius: 0.2.w,
                    backgroundImage: FileImage(File(cubit.image!.path))),

              ),
            ),
            SizedBox(
              height: 0.02.h,
            ),
             GText(
              color: AppColors.grayBlackColor,
              content:
              cubit.image == null?
              AppText.addChildPhoto :
               "تعديل صورة طفلك"
               ,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ],
        );
    },
    );
  }
}
