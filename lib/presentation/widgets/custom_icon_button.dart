import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.icon,
  });

  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heightScreen * .07,
        width: widthScreen * .15,
        decoration: BoxDecoration(
          color: MyColors.kOrange,
          borderRadius: BorderRadius.circular(
            widthScreen * .03,
          ),
        ),
        child: Icon(
          icon,
          color: MyColors.kWhite,
          size: heightScreen * .04,
        ),
      ),
    );
  }
}
