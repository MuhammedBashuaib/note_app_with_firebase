import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/sign_in_screen_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: const Scaffold(
        body: SignInScreenBody(),
      ),
    );
  }
}
