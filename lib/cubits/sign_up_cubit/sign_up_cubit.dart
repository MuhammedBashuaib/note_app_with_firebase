import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/data/services/auth_services/auth_service.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({required String email, required String password}) async {
    AuthService auth = AuthService();
    emit(SignUpLoadingState());
    try {
      await auth.signUp(
        email: email,
        password: password,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(
        SignUpFailureState(
          erorrMessage: e.code,
        ),
      );
    } catch (e) {
      emit(
        SignUpFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }
}
