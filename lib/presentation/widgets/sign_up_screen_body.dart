import 'package:flutter/material.dart';

import 'package:note_app_with_firebase/presentation/widgets/custom_icon_container.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_message_with_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/routes.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthScreen * .04),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
            Text(
              "SignUp",
              style: TextStyle(
                fontSize: fSize * 1.7,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: heightScreen * .01,
            ),
            Text(
              "SignUp To Continue Using The App",
              style: TextStyle(
                fontSize: fSize * 1.1,
                // fontWeight: FontWeight.bold,
                color: MyColors.kGrey,
              ),
            ),
            SizedBox(
              height: heightScreen * .05,
            ),
            CustomTextFormField(
              controller: usernameController,
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
              onPressed: () {},
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
    );
  }
}
