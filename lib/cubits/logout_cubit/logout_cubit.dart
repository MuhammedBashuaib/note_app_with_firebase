import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/services/auth_services/auth_service.dart';

part 'logout_state.dart';

class LogoutCubitCubit extends Cubit<LogoutCubitState> {
  LogoutCubitCubit() : super(LogoutCubitInitial());

  final AuthService _authService = AuthService();

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await _authService.logout();
      emit(LogoutSuccessState());
    } on Exception catch (e) {
      emit(
        LogoutFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }
}
