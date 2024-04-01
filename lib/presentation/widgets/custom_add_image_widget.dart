import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_icon_button.dart';

import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomAddImageWidget extends StatelessWidget {
  const CustomAddImageWidget({
    super.key,
    this.onTapCamaraButton,
    this.onTapGalleryButton,
    required this.imageFile,
    required this.color,
  });

  final void Function()? onTapCamaraButton;
  final void Function()? onTapGalleryButton;
  final File? imageFile;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: heightScreen * .25,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              widthScreen * .03,
            ),
            border: Border.all(
              color: MyColors.kGrey,
              width: 2,
            ),
          ),
          child: imageFile == null
              ? Icon(
                  Icons.image,
                  size: heightScreen * .15,
                )
              : Image.file(
                  imageFile!,
                ),
        ),
        SizedBox(
          height: heightScreen * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomIconButton(
              icon: Icons.photo,
              onTap: onTapGalleryButton,
            ),
            CustomIconButton(
              icon: Icons.camera_alt,
              onTap: onTapCamaraButton,
            )
          ],
        )
      ],
    );
  }
}
