import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_note_list_view_builder.dart';

class NoteViewScreenBody extends StatelessWidget {
  const NoteViewScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomNoteListViewBuilder();
  }
}
