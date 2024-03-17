import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app_with_firebase/data/services/auth_with_google_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //signUp
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  //signIn
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  //email verification
  void sendEmailVerification() {
    _auth.currentUser!.sendEmailVerification();
  }

  //logout
  Future<void> logout() async {
    AuthWithGoogleService().logoutWithGoogle();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
