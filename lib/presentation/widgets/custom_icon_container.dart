import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/images.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomIconContainer extends StatelessWidget {
  const CustomIconContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: heightScreen * .11,
      height: heightScreen * .11,
      decoration: BoxDecoration(
        color: MyColors.kGrey.withOpacity(.2),
        borderRadius: BorderRadius.circular(widthScreen),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: widthScreen * .02,
        ),
        child: Image.asset(
          MyImages.noteIcon,
          height: heightScreen * .07,
        ),
      ),
    );
  }
}
