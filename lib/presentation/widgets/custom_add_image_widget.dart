import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_icon_button.dart';

import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomAddImageWidget extends StatelessWidget {
  const CustomAddImageWidget({
    super.key,
  });

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
          child: Icon(
            Icons.image,
            size: heightScreen * .15,
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
              onTap: () {},
            ),
            CustomIconButton(
              icon: Icons.camera_alt,
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}
