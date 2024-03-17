import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class AddCategoryScreenBody extends StatelessWidget {
  const AddCategoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController categoyNameController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .04,
      ),
      child: Column(
        children: [
          SizedBox(
            height: heightScreen * .1,
          ),
          CustomTextFormField(
            controller: categoyNameController,
            obscureText: false,
            title: "Category Name",
            hintText: "Enter Category Name",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: heightScreen * .04,
          ),
          CustomMaterialButton(
            titleButton: "Add",
            horizontalPadding: widthScreen * .04,
            color: MyColors.kOrange,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
