import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/user_model.dart';
import 'package:note_app_with_firebase/data/services/auth_service.dart';
import 'package:note_app_with_firebase/data/services/auth_with_google_service.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_button_with_icon.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_definition_text.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_icon_container.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_message_with_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/images.dart';
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

  String? _email;
  String? _password;

  UserModel? userModel;

  void forgotPasswordButton() {
    if (_email != null) {
      try {
        auth.forgotPassword(_email!);
        customShowDialog(
          context: context,
          title: "Message",
          content: "An email has been sent",
        );
      } on Exception catch (e) {
        // ignore: avoid_print
        print(e.toString());
        customShowDialog(
          context: context,
          title: "Error",
          content: "No user found for that email.",
        );
      }
    } else {
      customShowDialog(
        context: context,
        title: "Error",
        content: "Enter Your Email",
      );
    }
  }

  Future<void> loginButton() async {
    // if (formKey.currentState!.validate()) {
    if (true) {
      try {
        await auth.signIn(
          email: _email!,
          password: _password!,
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(MyRoutes.homeScreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          customShowDialog(
            context: context,
            title: "Error",
            content: "No user found for that email.",
          );
        } else if (e.code == 'wrong-password') {
          customShowDialog(
            context: context,
            title: "Error",
            content: "Wrong password provided for that user.",
          );
        }
      }
    }
  }

  Future<void> loginWithGoogleButton() async {
    try {
      if (await AuthWithGoogleService().signInWithGoogle() != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(MyRoutes.homeScreen);
      }
    } on Exception catch (e) {
      customShowDialog(context: context, title: "Error", content: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .04,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Column(
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
                    title: "Login",
                    difinitionText: "Login To Continue Using The App",
                  ),
                  SizedBox(
                    height: heightScreen * .05,
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
                  Container(
                    alignment: Alignment.topRight,
                    child: CustomTextButton(
                      text: "Forgot Password ?",
                      textColor: MyColors.kBlack.withOpacity(0.4),
                      onPressed: forgotPasswordButton,
                    ),
                  ),
                  SizedBox(
                    height: heightScreen * .02,
                  ),
                ],
              ),
              CustomMaterialButton(
                titleButton: "Login",
                color: MyColors.kOrange,
                horizontalPadding: widthScreen * .408,
                onPressed: loginButton,
              ),
              SizedBox(
                height: heightScreen * .03,
              ),
              CustomButtonWithIcon(
                buttonTitle: "Login With Google",
                buttonColor: MyColors.kMaroon,
                icon: MyImages.googleIcon,
                onTap: loginWithGoogleButton,
              ),
              SizedBox(
                height: heightScreen * .03,
              ),
              CustomMessageWithTextButton(
                message: "Don't Have An Account ?",
                text: "Register",
                textColor: MyColors.kOrange,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(MyRoutes.signUpScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
