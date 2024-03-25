import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:note_app_with_firebase/cubits/edit_category_cubit/edit_category_cubit.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/presentation/widgets/edit_category_form.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class EditCategoryScreenBody extends StatefulWidget {
  const EditCategoryScreenBody({super.key});

  @override
  State<EditCategoryScreenBody> createState() => _EditCategoryScreenBodyState();
}

class _EditCategoryScreenBodyState extends State<EditCategoryScreenBody> {
  TextEditingController categoyNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    return BlocConsumer<EditCategoryCubit, EditCategoryState>(
      listener: (context, state) {
        if (state is EditCategorySuccessState) {
          customShowDialog(
            context: context,
            title: "Message",
            content: "Modified successfully",
            onPressed: null,
          );
        }
        if (state is EditCategoryFailureState) {
          customShowDialog(
            context: context,
            title: "Message",
            content: "Failed to edit user: ${state.erorrMessage}",
            onPressed: null,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is EditCategoryLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widthScreen * .04,
            ),
            child: EditCategoryForm(
              formKey: formKey,
              categoyNameController: categoyNameController,
              category: category,
            ),
          ),
        );
      },
    );
  }
}
