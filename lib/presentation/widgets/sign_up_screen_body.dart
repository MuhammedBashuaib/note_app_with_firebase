import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:note_app_with_firebase/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/presentation/widgets/sign_up_form.dart';
import 'package:note_app_with_firebase/res/routes.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          Navigator.of(context).pushReplacementNamed(MyRoutes.signInScreen);
        }
        if (state is SignUpFailureState) {
          if (state.erorrMessage == 'weak-password') {
            customShowDialog(
              context: context,
              title: "Error",
              content: "The password provided is too weak.",
              onPressed: null,
            );
          } else if (state.erorrMessage == 'email-already-in-use') {
            customShowDialog(
              context: context,
              title: "Error",
              content: "The account already exists for that email.",
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
          inAsyncCall: state is SignUpLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * .04),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SignUpForm(
                  formKey: formKey,
                  usernameController: usernameController,
                  emailController: emailController,
                  passwordController: passwordController,
                )),
          ),
        );
      },
    );
  }
}
