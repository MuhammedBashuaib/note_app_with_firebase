import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/sign_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SignInScreenBody(),
    );
  }
}
