import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_button.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomMessageWithTextButton extends StatelessWidget {
  const CustomMessageWithTextButton({
    super.key,
    required this.message,
    required this.text,
    required this.textColor,
    this.onPressed,
  });
  final String message;
  final String text;
  final Color textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: fSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomTextButton(
          text: text,
          textColor: textColor,
          onPressed: onPressed,
        )
      ],
    );
  }
}
