import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:note_app_with_firebase/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app_with_firebase/data/models/category_model.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_note_list_view_builder.dart';
import 'package:note_app_with_firebase/presentation/widgets/custom_show_dialog.dart';
// import 'package:note_app_with_firebase/res/variable_models.dart';

class NoteViewScreenBody extends StatefulWidget {
  const NoteViewScreenBody({super.key, required this.category});

  final CategoryModel category;

  @override
  State<NoteViewScreenBody> createState() => _NoteViewScreenBodyState();
}

class _NoteViewScreenBodyState extends State<NoteViewScreenBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context)
        .getAllNotes(categoryId: widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = [];
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesSuccessState) {
          notes.clear();
          notes.addAll(state.notes);
        }
        if (state is NotesFailureState) {
          customShowDialog(
            context: context,
            title: "Error",
            content: state.erorrMessage,
            onPressed: null,
          );
        }
      },
      builder: (context, state) {
        return state is NotesLoadingState
            ? const Center(child: CircularProgressIndicator())
            : CustomNoteListViewBuilder(notes: notes);
      },
    );
  }
}
