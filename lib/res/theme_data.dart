import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

ThemeData themeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.kGreyLight,
      titleTextStyle: TextStyle(
        color: MyColors.kOrange,
        fontSize: fSize * 1.3,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: MyColors.kOrange,
        size: heightScreen * .03,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MyColors.kOrange,
      iconSize: heightScreen * .035,
    ),
  );
}
