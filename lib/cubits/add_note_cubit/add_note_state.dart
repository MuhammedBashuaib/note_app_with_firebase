part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoadingState extends AddNoteState {}

final class AddNoteSuccessState extends AddNoteState {}

final class AddNoteFailureState extends AddNoteState {
  final String erorrMessage;

  AddNoteFailureState({
    required this.erorrMessage,
  });
}
