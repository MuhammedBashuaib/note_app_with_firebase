import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_note_item.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomNoteListViewBuilder extends StatelessWidget {
  const CustomNoteListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .02,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: heightScreen * .01,
          ),
          child: CustomNoteItem(
            noteTitle: "Note",
            note: "Flutter content note",
            date: "26 mars 2023",
            onTap: () {},
          ),
        );
      },
    );
  }
}
