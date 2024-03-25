import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/presentation/widgets/add_note_screen_body.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: const AddNoteScreenBody(),
    );
  }
}
