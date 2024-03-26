import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/screens/add_category_screen.dart';
import 'package:note_app_with_firebase/presentation/screens/add_note_screen.dart';
import 'package:note_app_with_firebase/presentation/screens/note_view_screen.dart';
import 'package:note_app_with_firebase/presentation/screens/edit_category_screen.dart';
import 'package:note_app_with_firebase/presentation/screens/home_screen.dart';
import 'package:note_app_with_firebase/presentation/screens/sign_in_screen.dart';
import 'package:note_app_with_firebase/presentation/screens/sign_up_screen.dart';

class MyRoutes {
  static const String signInScreen = "signInScreen";
  static const String signUpScreen = "signUpScreen";
  static const String homeScreen = "homeScreen";
  static const String addCategoryScreen = "addCategoryScreen";
  static const String categoryScreen = "categoryScreen";
  static const String editCategoryScreen = "editCategoryScreen";
  static const String addNoteScreen = "addNoteScreen";
}

Map<String, Widget Function(BuildContext)> routes = {
  MyRoutes.signInScreen: (context) => const SignInScreen(),
  MyRoutes.signUpScreen: (context) => const SignUpScreen(),
  MyRoutes.homeScreen: (context) => const HomeScreen(),
  MyRoutes.addCategoryScreen: (context) => const AddCategoryScreen(),
  MyRoutes.categoryScreen: (context) => const NoteViewScreen(),
  MyRoutes.editCategoryScreen: (context) => const EditCategoryScreen(),
  MyRoutes.addNoteScreen: (context) => const AddNoteScreen(),
};
