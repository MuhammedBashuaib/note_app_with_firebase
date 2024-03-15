import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<User?> signUp(String email, String password) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<User?> signIn(String email, String password) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
