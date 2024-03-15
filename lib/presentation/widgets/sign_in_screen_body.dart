import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_button_with_icon.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_icon_container.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_message_with_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/images.dart';
import 'package:note_app_with_firebase/res/routes.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .04,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: fSize * 1.7,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: heightScreen * .01,
                ),
                Text(
                  "Login To Continue Using The App",
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
                  controller: emailController,
                  title: "Email",
                  hintText: "Enter Your Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: heightScreen * .02,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  title: "Password",
                  hintText: "Enter Your Password",
                  keyboardType: TextInputType.emailAddress,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: CustomTextButton(
                    text: "Forgot Password ?",
                    textColor: MyColors.kBlack.withOpacity(0.4),
                    onPressed: () {},
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
              onPressed: () {},
            ),
            SizedBox(
              height: heightScreen * .03,
            ),
            CustomButtonWithIcon(
              buttonTitle: "Login With Google",
              buttonColor: MyColors.kMaroon,
              icon: MyImages.googleIcon,
              onTap: () {},
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
    );
  }
}
