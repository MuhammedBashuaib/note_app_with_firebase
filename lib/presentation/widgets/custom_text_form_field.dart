import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    required this.obscureText,
  });
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fSize * 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: heightScreen * .01,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: fSize,
              color: MyColors.kGrey,
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: heightScreen * .01,
              horizontal: widthScreen * .055,
            ),
            filled: true,
            fillColor: MyColors.kGrey.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widthScreen * .1),
              borderSide: const BorderSide(
                color: MyColors.kGrey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widthScreen * .1),
              borderSide: const BorderSide(
                color: MyColors.kGrey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
