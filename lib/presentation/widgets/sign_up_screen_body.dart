import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/user_model.dart';
import 'package:note_app_with_firebase/data/services/auth_service.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_definition_text.dart';

import 'package:note_app_with_firebase/presentation/widgets/custom_icon_container.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_message_with_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
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

  AuthService auth = AuthService();

  // String? _username;
  String? _email;
  String? _password;

  UserModel? userModel;

  Future signUpButton() async {
    // if (formKey.currentState!.validate()) {
    if (true) {
      try {
        await auth.signUp(
          email: _email!,
          password: _password!,
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(MyRoutes.signInScreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          customShowDialog(
            context: context,
            title: "Error",
            content: "The password provided is too weak.",
          );
        } else if (e.code == 'email-already-in-use') {
          customShowDialog(
            context: context,
            title: "Error",
            content: "The account already exists for that email.",
          );
        }
      } catch (e) {
        customShowDialog(
          context: context,
          title: "Error",
          content: e.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthScreen * .04),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heightScreen * .12,
              ),
              const Center(
                child: CustomIconContainer(),
              ),
              SizedBox(
                height: heightScreen * .05,
              ),
              const CustomDefinitionText(
                title: "SignUp",
                difinitionText: "SignUp To Continue Using The App",
              ),
              SizedBox(
                height: heightScreen * .05,
              ),
              CustomTextFormField(
                controller: usernameController,
                // onChanged: (value) => _username = value,
                obscureText: false,
                title: "Username",
                hintText: "Enter Your Username",
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: heightScreen * .02,
              ),
              CustomTextFormField(
                controller: emailController,
                onChanged: (value) => _email = value,
                obscureText: false,
                title: "Email",
                hintText: "Enter Your Email",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: heightScreen * .02,
              ),
              CustomTextFormField(
                controller: passwordController,
                onChanged: (value) => _password = value,
                obscureText: true,
                title: "Password",
                hintText: "Enter Your Password",
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: heightScreen * .06,
              ),
              CustomMaterialButton(
                titleButton: "SignUp",
                color: MyColors.kOrange,
                horizontalPadding: widthScreen * .395,
                onPressed: signUpButton,
              ),
              SizedBox(
                height: heightScreen * .01,
              ),
              CustomMessageWithTextButton(
                message: "Have An Account ?",
                text: "Login",
                textColor: MyColors.kOrange,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(MyRoutes.signInScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
