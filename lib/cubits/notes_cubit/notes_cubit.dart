import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_with_firebase/data/models/note_model.dart';
import 'package:note_app_with_firebase/data/services/firestore_services/note_service.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  final NoteService _noteService = NoteService();

  Future<void> getAllNotes({required String categoryId}) async {
    emit(NotesLoadingState());
    List<NoteModel> notes = [];
    try {
      notes.addAll(
        await _noteService.getAllNotes(
          categoryId: categoryId,
        ),
      );
      emit(
        NotesSuccessState(
          notes: notes,
        ),
      );
    } on Exception catch (e) {
      emit(
        NotesFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }
}
