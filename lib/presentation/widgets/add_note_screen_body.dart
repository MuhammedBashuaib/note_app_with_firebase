import 'package:flutter/material.dart';

import 'package:note_app_with_firebase/presentation/widgets/custom_material_button.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_text_form_field.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class AddNoteScreenBody extends StatefulWidget {
  const AddNoteScreenBody({super.key});

  @override
  State<AddNoteScreenBody> createState() => _AddNoteScreenBodyState();
}

class _AddNoteScreenBodyState extends State<AddNoteScreenBody> {
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthScreen * .04),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
      ),
    );
  }
}
