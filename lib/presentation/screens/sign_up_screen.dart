import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const Scaffold(
        body: SignUpScreenBody(),
      ),
    );
  }
}
