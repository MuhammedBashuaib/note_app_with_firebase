import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:note_app_with_firebase/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:note_app_with_firebase/data/services/auth_services/auth_service.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/presentation/widgets/sign_in_form.dart';
import 'package:note_app_with_firebase/res/routes.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthService auth = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          if (state.isPasswordState) {
            customShowDialog(
              context: context,
              title: "Message",
              content: "An email has been sent",
              onPressed: null,
            );
          } else {
            Navigator.of(context).pushReplacementNamed(MyRoutes.homeScreen);
          }
        }
        if (state is SignInFailureState) {
          if (state.erorrMessage == 'user-not-found') {
            customShowDialog(
              context: context,
              title: "Error",
              content: "No user found for that email.",
              onPressed: null,
            );
          } else if (state.erorrMessage == 'wrong-password') {
            customShowDialog(
              context: context,
              title: "Error",
              content: "Wrong password provided for that user.",
              onPressed: null,
            );
          } else {
            customShowDialog(
              context: context,
              title: "Error",
              content: state.erorrMessage,
              onPressed: null,
            );
          }
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widthScreen * .04,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SingInForm(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
            ),
          ),
        );
      },
    );
  }
}
