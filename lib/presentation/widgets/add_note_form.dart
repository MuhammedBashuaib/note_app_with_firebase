import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app_with_firebase/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_add_image_widget.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
    required this.formKey,
    required this.noteTitleController,
    required this.noteController,
    required this.category,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController noteTitleController;
  final TextEditingController noteController;
  final CategoryModel category;

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    BuildContext currentContext = context;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: heightScreen * .05,
          ),
          CustomAddImageWidget(),
          Divider(
            height: heightScreen * .05,
            thickness: 1,
          ),
          CustomTextFormField(
            controller: widget.noteTitleController,
            obscureText: false,
            title: "Note Titel",
            hintText: "Enter The Note Titel",
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: heightScreen * .02,
          ),
          CustomTextFormField(
            controller: widget.noteController,
            maxLines: 6,
            obscureText: false,
            title: "Note",
            hintText: "Enter The Note",
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
              if (widget.formKey.currentState!.validate()) {
                await BlocProvider.of<AddNoteCubit>(context).addNote(
                  categoryId: widget.category.id,
                  noteTitle: widget.noteTitleController.text,
                  note: widget.noteController.text,
                  createdDate: DateTime.now(),
                );
                widget.noteTitleController.clear();
                widget.noteController.clear();
                setState(() {
                  BlocProvider.of<NotesCubit>(currentContext)
                      .getAllNotes(categoryId: widget.category.id);
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
