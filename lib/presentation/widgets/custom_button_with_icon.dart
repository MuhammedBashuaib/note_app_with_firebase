import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/images.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.icon,
    required this.buttonTitle,
    this.onTap,
    required this.buttonColor,
  });
  final String icon;
  final String buttonTitle;
  final void Function()? onTap;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: heightScreen * .01,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(widthScreen * .1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonTitle,
              style: TextStyle(
                fontSize: fSize * 1,
                fontWeight: FontWeight.bold,
                color: MyColors.kWhite,
              ),
            ),
            SizedBox(
              width: widthScreen * .03,
            ),
            Image.asset(
              icon,
              height: heightScreen * .03,
            ),
          ],
        ),
      ),
    );
  }
}
