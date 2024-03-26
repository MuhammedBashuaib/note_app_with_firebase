part of 'edit_note_cubit.dart';

@immutable
sealed class EditNoteState {}

final class EditNoteInitial extends EditNoteState {}

final class EditNoteLoadingState extends EditNoteState {}

final class EditNoteSuccessState extends EditNoteState {}

final class EditNoteFailureState extends EditNoteState {
  final String erorrMessage;

  EditNoteFailureState({
    required this.erorrMessage,
  });
}
