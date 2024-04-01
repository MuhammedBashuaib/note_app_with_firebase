import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:note_app_with_firebase/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/helper/image_picker.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_add_image_widget.dart';
// import 'package:note_app_with_firebase/presentation/widgets/custom_add_image_widget.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class EditNoteForm extends StatefulWidget {
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
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: heightScreen * .05,
          ),
          CustomAddImageWidget(
            imageUrl: note.imageUrl,
            imageFile: imageFile,
            onTapCamaraButton: () async {
              imageFile = await pickImageFormCamera();
              setState(() {});
            },
            onTapGalleryButton: () async {
              imageFile = await pickImageFormGallery();
              setState(() {});
            },
          ),
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
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                BlocProvider.of<EditNoteCubit>(context).editNote(
                  categoryId: widget.note.categoryId,
                  noteId: widget.note.id,
                  newNoteTitle: widget.noteTitleController.text,
                  newNote: widget.noteController.text,
                );
                BlocProvider.of<NotesCubit>(context)
                    .getAllNotes(categoryId: widget.note.categoryId);
              }
            },
          ),
        ],
      ),
    );
  }
}
