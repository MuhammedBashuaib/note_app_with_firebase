import 'package:flutter/material.dart';
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
  });

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
            height: heightScreen * .1,
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
