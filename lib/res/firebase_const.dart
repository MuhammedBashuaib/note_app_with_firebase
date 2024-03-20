import 'package:firebase_auth/firebase_auth.dart';

class MyFirebaseConst {
  static User? currentUser = FirebaseAuth.instance.currentUser;
}
