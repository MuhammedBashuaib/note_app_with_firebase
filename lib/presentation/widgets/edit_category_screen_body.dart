import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class EditCategoryScreenBody extends StatelessWidget {
  const EditCategoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    TextEditingController categoyNameController = TextEditingController();
    // var currentContext = context;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .04,
      ),
      child: Form(
        // key: widget.formKey,
        child: Column(
          children: [
            SizedBox(
              height: heightScreen * .1,
            ),
            CustomTextFormField(
              controller: categoyNameController,
              obscureText: false,
              title: "Category Name",
              hintText: category.categoryName,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: heightScreen * .04,
            ),
            CustomMaterialButton(
              titleButton: "Edit",
              horizontalPadding: widthScreen * .04,
              color: MyColors.kOrange,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
