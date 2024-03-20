part of 'logout_cubit.dart';

@immutable
sealed class LogoutCubitState {}

final class LogoutCubitInitial extends LogoutCubitState {}

final class LogoutLoadingState extends LogoutCubitState {}

final class LogoutSuccessState extends LogoutCubitState {}

final class LogoutFailureState extends LogoutCubitState {
  final String erorrMessage;

  LogoutFailureState({
    required this.erorrMessage,
  });
}
