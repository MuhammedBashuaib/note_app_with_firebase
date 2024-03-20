import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/sign_in_cubit/sign_in_cubit.dart';

import 'package:note_app_with_firebase/presentation/widgets/custom_button_with_icon.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_definition_text.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_icon_container.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_message_with_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/images.dart';
import 'package:note_app_with_firebase/res/routes.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class SingInForm extends StatelessWidget {
  const SingInForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                // onChanged: (value) => _email = value,
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
                // onChanged: (value) => _password = value,
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
                  onPressed: () {
                    BlocProvider.of<SignInCubit>(context).forgotPassword(
                      email: emailController.text,
                    );
                  },
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
            onPressed: () {
              // if (formKey.currentState!.validate()) {
              if (true) {
                BlocProvider.of<SignInCubit>(context).signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
          ),
          SizedBox(
            height: heightScreen * .03,
          ),
          CustomButtonWithIcon(
            buttonTitle: "Login With Google",
            buttonColor: MyColors.kMaroon,
            icon: MyImages.googleIcon,
            onTap: () {
              BlocProvider.of<SignInCubit>(context).signInWithGoogle();
            },
          ),
          SizedBox(
            height: heightScreen * .03,
          ),
          CustomMessageWithTextButton(
            message: "Don't Have An Account ?",
            text: "Register",
            textColor: MyColors.kOrange,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(MyRoutes.signUpScreen);
            },
          )
        ],
      ),
    );
  }
}
