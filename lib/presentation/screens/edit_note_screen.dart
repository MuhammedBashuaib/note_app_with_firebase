import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/edite_note_screen_body.dart';

class EditeNoteScreen extends StatelessWidget {
  const EditeNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Edite"),
      ),
      body: EditeNoteScreenBody(note: note),
    );
  }
}
