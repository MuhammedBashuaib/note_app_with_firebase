import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/edit_note_screen_body.dart';

class EditeNoteScreen extends StatelessWidget {
  const EditeNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return BlocProvider(
      create: (context) => EditNoteCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Note Edite"),
        ),
        body: EditNoteScreenBody(note: note),
      ),
    );
  }
}
