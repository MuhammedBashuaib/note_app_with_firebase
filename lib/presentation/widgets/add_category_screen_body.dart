import 'package:flutter/material.dart';
// import 'package:note_app_with_firebase/data/services/firestore_services/category_service.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class AddCategoryScreenBody extends StatefulWidget {
  const AddCategoryScreenBody({super.key});

  @override
  State<AddCategoryScreenBody> createState() => _AddCategoryScreenBodyState();
}

class _AddCategoryScreenBodyState extends State<AddCategoryScreenBody> {
  TextEditingController categoyNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // addCategoryButton() async {
  //   if (formKey.currentState!.validate()) {
  //     await CategoryService().addCategory(
  //       categoryName: categoyNameController.text,
  //       context: context,
  //     );
  //     categoyNameController.clear();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .04,
      ),
      child: Form(
        key: formKey,
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
              keyboardType: TextInputType.text,
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
      ),
    );
  }
}
