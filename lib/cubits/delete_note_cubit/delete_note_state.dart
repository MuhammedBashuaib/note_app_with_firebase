part of 'delete_note_cubit.dart';

@immutable
sealed class DeleteNoteState {}

final class DeleteNoteInitial extends DeleteNoteState {}

final class DeleteNoteLoadingState extends DeleteNoteState {}

final class DeleteNoteSuccessState extends DeleteNoteState {}

final class DeleteNoteFailureState extends DeleteNoteState {
  final String erorrMessage;

  DeleteNoteFailureState({
    required this.erorrMessage,
  });
}
