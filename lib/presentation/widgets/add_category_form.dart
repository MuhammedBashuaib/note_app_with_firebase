import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/add_category_cubit/add_category_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class AddCategoryForm extends StatelessWidget {
  const AddCategoryForm({
    super.key,
    required this.formKey,
    required this.categoyNameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController categoyNameController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
            onPressed: () async {
              await BlocProvider.of<AddCategoryCubit>(context).addCategory(
                uid: FirebaseAuth.instance.currentUser!.uid,
                categoryName: categoyNameController.text,
              );
              categoyNameController.clear();
            },
          ),
        ],
      ),
    );
  }
}
