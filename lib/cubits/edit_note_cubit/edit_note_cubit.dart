import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/note_service.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  final NoteService _noteService = NoteService();

  Future<void> editNote({
    required String categoryId,
    required String noteId,
    required String newNoteTitle,
    required String newNote,
    required String imageUrl,
    required File? imageFile,
  }) async {
    emit(EditNoteLoadingState());
    try {
      await _noteService.editNote(
        categoryId: categoryId,
        noteId: noteId,
        imageUrl: imageUrl,
        imageFile: imageFile,
        newNoteTitle: newNoteTitle,
        newNote: newNote,
      );
      emit(EditNoteSuccessState());
    } on Exception catch (e) {
      emit(
        EditNoteFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }
}
