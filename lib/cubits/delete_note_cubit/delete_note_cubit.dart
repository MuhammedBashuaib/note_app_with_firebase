import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/note_service.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());

  final NoteService _noteService = NoteService();

  Future<void> deleteNote({
    required String categoryId,
    required String noteId,
    required String imageUrl,
  }) async {
    emit(DeleteNoteLoadingState());
    try {
      _noteService.deleteNote(
        categoryId: categoryId,
        id: noteId,
        imageUrl: imageUrl,
      );
      emit(
        DeleteNoteSuccessState(),
      );
    } on Exception catch (e) {
      emit(
        DeleteNoteFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }
}
