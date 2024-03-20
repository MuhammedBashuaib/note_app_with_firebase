part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutCubitInitial extends LogoutState {}

final class LogoutLoadingState extends LogoutState {}

final class LogoutSuccessState extends LogoutState {}

final class LogoutFailureState extends LogoutState {
  final String erorrMessage;

  LogoutFailureState({
    required this.erorrMessage,
  });
}
