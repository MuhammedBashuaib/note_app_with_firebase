import 'package:flutter/material.dart';

import 'package:note_app_with_firebase/res/sizes.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.textColor,
  });
  final String text;
  final void Function()? onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fSize,
        ),
      ),
    );
  }
}
