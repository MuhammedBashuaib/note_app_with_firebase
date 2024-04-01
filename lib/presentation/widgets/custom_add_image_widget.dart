import 'dart:io';

import 'package:flutter/material.dart';

import 'package:note_app_with_firebase/presentation/widgets/custom_cached_netword_image.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_icon_button.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomAddImageWidget extends StatelessWidget {
  const CustomAddImageWidget({
    super.key,
    this.onTapCamaraButton,
    this.onTapGalleryButton,
    required this.imageFile,
    this.imageUrl = "",
  });

  final void Function()? onTapCamaraButton;
  final void Function()? onTapGalleryButton;
  final File? imageFile;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: heightScreen * .25,
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyColors.kGrey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(
              widthScreen * .03,
            ),
            border: Border.all(
              color: MyColors.kGrey,
              width: 2,
            ),
          ),
          child: imageUrl != "" && imageFile == null
              ? CustomCachedNetworkImage(imageUrl: imageUrl)
              : imageFile == null
                  ? imageUrl == ""
                      ? Icon(
                          Icons.image,
                          size: heightScreen * .15,
                          color: MyColors.kBlack.withOpacity(0.5),
                        )
                      : CustomCachedNetworkImage(imageUrl: imageUrl)
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
