import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/note_service.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  final NoteService _noteService = NoteService();

  Future<void> addNote({
    required String categoryId,
    required File imageFile,
    required String noteTitle,
    required String note,
    required DateTime createdDate,
  }) async {
    emit(AddNoteLoadingState());
    String value = await _noteService.addNote(
      categoryId: categoryId,
      imageFile: imageFile,
      noteTitle: noteTitle,
      note: note,
      createdDate: createdDate,
    );
    if (value == "success") {
      emit(AddNoteSuccessState());
    } else {
      emit(
        AddNoteFailureState(
          erorrMessage: value,
        ),
      );
    }
  }
}
