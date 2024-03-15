import 'package:flutter/material.dart';

import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    this.onPressed,
    required this.titleButton,
    required this.horizontalPadding,
    required this.color,
  });

  final void Function()? onPressed;
  final String titleButton;
  final double horizontalPadding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: heightScreen * .05,
      color: color,
      textColor: MyColors.kWhite,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widthScreen * .1),
      ),
      child: Text(
        titleButton,
        style: TextStyle(
          fontSize: fSize * 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
