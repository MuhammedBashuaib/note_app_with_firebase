import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:note_app_with_firebase/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_add_image_widget.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class EditNoteForm extends StatelessWidget {
  const EditNoteForm({
    super.key,
    required this.formKey,
    required this.noteTitleController,
    required this.noteController,
    required this.note,
  });

  final NoteModel note;
  final GlobalKey<FormState> formKey;
  final TextEditingController noteTitleController;
  final TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
            controller: noteTitleController,
            obscureText: false,
            title: "Note Titel",
            hintText: "Enter The Note Titel",
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: heightScreen * .02,
          ),
          CustomTextFormField(
            controller: noteController,
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
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<EditNoteCubit>(context).editNote(
                  categoryId: note.categoryId,
                  noteId: note.id,
                  newNoteTitle: noteTitleController.text,
                  newNote: noteController.text,
                );
                BlocProvider.of<NotesCubit>(context)
                    .getAllNotes(categoryId: note.categoryId);
              }
            },
          ),
        ],
      ),
    );
  }
}
