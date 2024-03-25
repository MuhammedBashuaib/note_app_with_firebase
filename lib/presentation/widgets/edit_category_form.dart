import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/edit_category_cubit/edit_category_cubit.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/firebase_const.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

import '../../cubits/categories_cubit/categories_cubit.dart';

class EditCategoryForm extends StatefulWidget {
  const EditCategoryForm({
    super.key,
    required this.formKey,
    required this.categoyNameController,
    required this.category,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController categoyNameController;
  final CategoryModel category;

  @override
  State<EditCategoryForm> createState() => _EditCategoryFormState();
}

class _EditCategoryFormState extends State<EditCategoryForm> {
  @override
  void dispose() {
    widget.categoyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentContext = context;

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: heightScreen * .1,
          ),
          CustomTextFormField(
            controller: widget.categoyNameController,
            obscureText: false,
            title: "Category Name",
            hintText: widget.category.categoryName,
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: heightScreen * .04,
          ),
          CustomMaterialButton(
            titleButton: "Edit",
            horizontalPadding: widthScreen * .04,
            color: MyColors.kOrange,
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                customShowDialog(
                  context: context,
                  title: "Message",
                  content: "Are you sure you want to change the item name?",
                  showCancelButton: true,
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await BlocProvider.of<EditCategoryCubit>(context)
                        .editCategory(
                      categoryId: widget.category.id,
                      categorName: widget.categoyNameController.text,
                    );
                    setState(() {
                      widget.category.categoryName =
                          widget.categoyNameController.text;
                      widget.categoyNameController.clear();
                      BlocProvider.of<CategoriesCubit>(currentContext)
                          .getAllCategories(
                              uid: MyFirebaseConst.currentUser!.uid);
                    });
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
