import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //signUp
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  //logout
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
