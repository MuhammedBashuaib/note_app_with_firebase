import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:note_app_with_firebase/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/add_note_form.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class AddNoteScreenBody extends StatefulWidget {
  const AddNoteScreenBody({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  State<AddNoteScreenBody> createState() => _AddNoteScreenBodyState();
}

class _AddNoteScreenBodyState extends State<AddNoteScreenBody> {
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccessState) {
          customShowDialog(
            context: context,
            title: "Message",
            content: "category Added",
            onPressed: null,
          );
        }
        if (state is AddNoteFailureState) {
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
          inAsyncCall: state is AddNoteLoadingState ? true : false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widthScreen * .04),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AddNoteForm(
                formKey: formKey,
                noteTitleController: noteTitleController,
                noteController: noteController,
                category: widget.category,
              ),
            ),
          ),
        );
      },
    );
  }
}
