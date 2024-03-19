import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_definition_text.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_icon_container.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_message_with_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/routes.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
            // onChanged: (value) => email = value,
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
            // onChanged: (value) => password = value,
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
            onPressed: () {
              // if (formKey.currentState!.validate()) {
              if (true) {
                BlocProvider.of<SignUpCubit>(context).signUp(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
          ),
          SizedBox(
            height: heightScreen * .01,
          ),
          CustomMessageWithTextButton(
            message: "Have An Account ?",
            text: "Login",
            textColor: MyColors.kOrange,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(MyRoutes.signInScreen);
            },
          )
        ],
      ),
    );
  }
}
