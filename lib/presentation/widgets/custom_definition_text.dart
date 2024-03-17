import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomDefinitionText extends StatelessWidget {
  const CustomDefinitionText({
    super.key,
    required this.title,
    required this.difinitionText,
  });

  final String title;
  final String difinitionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fSize * 1.7,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: heightScreen * .01,
        ),
        Text(
          difinitionText,
          style: TextStyle(
            fontSize: fSize * 1.1,
            // fontWeight: FontWeight.bold,
            color: MyColors.kGrey,
          ),
        ),
      ],
    );
  }
}
