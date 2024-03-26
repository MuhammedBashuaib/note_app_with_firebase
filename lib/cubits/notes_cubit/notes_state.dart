part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoadingState extends NotesState {}

final class NotesSuccessState extends NotesState {}

final class NotesFailureState extends NotesState {
  final String erorrMessage;

  NotesFailureState({
    required this.erorrMessage,
  });
}
