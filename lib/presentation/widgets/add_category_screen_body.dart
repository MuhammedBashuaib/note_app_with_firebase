import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:note_app_with_firebase/cubits/add_category_cubit/add_category_cubit.dart';
import 'package:note_app_with_firebase/presentation/widgets/add_category_form.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class AddCategoryScreenBody extends StatefulWidget {
  const AddCategoryScreenBody({super.key});

  @override
  State<AddCategoryScreenBody> createState() => _AddCategoryScreenBodyState();
}

class _AddCategoryScreenBodyState extends State<AddCategoryScreenBody> {
  TextEditingController categoyNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    categoyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCategoryCubit, AddCategoryState>(
      listener: (context, state) {
        if (state is AddCategorySuccessState) {
          customShowDialog(
            context: context,
            title: "Message",
            content: "category Added",
            onPressed: null,
          );
        }
        if (state is AddCategoryFailureState) {
          customShowDialog(
            context: context,
            title: "Message",
            content: "Failed to add user: ${state.erorrMessage}",
            onPressed: null,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddCategoryLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widthScreen * .04,
            ),
            child: AddCategoryForm(
              formKey: formKey,
              categoyNameController: categoyNameController,
            ),
          ),
        );
      },
    );
  }
}
