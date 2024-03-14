import 'package:flutter/material.dart';

//Screen coordinates and the default size of the font
double widthScreen = 0;
double heightScreen = 0;
double fSize = 0;

initializeHWFSize(BuildContext context) {
  widthScreen = MediaQuery.of(context).size.width;
  heightScreen = MediaQuery.of(context).size.height;
  fSize = widthScreen / 25;
}
