import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:note_app_with_firebase/data/services/auth_services/auth_service.dart';
import 'package:note_app_with_firebase/data/services/auth_services/auth_with_google_service.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  final AuthService _auth = AuthService();
  final AuthWithGoogleService _authWithGoogle = AuthWithGoogleService();

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoadingState());
    try {
      await _auth.signIn(
        email: email,
        password: password,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(
        SignInFailureState(
          erorrMessage: e.code,
        ),
      );
    } catch (e) {
      emit(
        SignInFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoadingState());
    try {
      if (await _authWithGoogle.signInWithGoogle() != null) {
        emit(SignInSuccessState());
      } else {
        emit(SignInCancel());
      }
    } on Exception catch (e) {
      emit(
        SignInFailureState(
          erorrMessage: e.toString(),
        ),
      );
    }
  }
}
