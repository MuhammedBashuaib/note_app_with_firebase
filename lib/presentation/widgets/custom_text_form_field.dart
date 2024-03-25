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
    this.maxLines = 1,
    this.onChanged,
  });
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscureText;
  final void Function(String)? onChanged;
  final int maxLines;

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
          // ignore: body_might_complete_normally_nullable
          validator: (value) {
            if (value!.isNotEmpty) {
              if (obscureText) {
                //password validation
                if (value.length > 8) {
                  bool hasUppercase = false;
                  bool hasLowercase = false;
                  bool hasDigit = false;

                  for (int i = 0; i < value.length; i++) {
                    if (value[i].toUpperCase() != value[i]) {
                      hasLowercase = true;
                    }
                    if (value[i].toLowerCase() != value[i]) {
                      hasUppercase = true;
                    }
                    if (int.tryParse(value[i]) != null) {
                      hasDigit = true;
                    }
                  }
                  if (hasUppercase && hasLowercase && hasDigit) {
                    return null;
                  } else {
                    return "The password must contain an uppercase letter, a lowercase letter, and at least one number";
                  }
                } else {
                  return "Password length must be at least 8 characters";
                }
              } else {
                //email validation
                if (keyboardType == TextInputType.emailAddress) {
                  final RegExp emailRegex = RegExp(
                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
                  );
                  if (emailRegex.hasMatch(value)) {
                    return null;
                  } else {
                    return "The email address you entered is incorrect";
                  }
                } else {
                  return null;
                }
              }
            } else if (value.isEmpty) {
              return "The field is required";
            } else {
              return null;
            }
          },
          maxLines: maxLines,
          controller: controller,
          onChanged: onChanged,
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
