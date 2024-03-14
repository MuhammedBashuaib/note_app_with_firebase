import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/screens/sign_in_screen.dart';

class MyRoutes {
  static const String signInScreen = "signInScreen";
}

Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.signInScreen: (context) => const SignInScreen(),
};
