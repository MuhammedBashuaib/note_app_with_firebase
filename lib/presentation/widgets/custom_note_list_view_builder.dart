import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_note_item.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomNoteListViewBuilder extends StatelessWidget {
  const CustomNoteListViewBuilder({
    super.key,
    required this.notes,
  });

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .02,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: heightScreen * .01,
          ),
          child: CustomNoteItem(
            noteTitle: notes[index].noteTitle,
            note: notes[index].note,
            date: notes[index].createdDate.toString(),
            onTap: () {},
          ),
        );
      },
    );
  }
}
