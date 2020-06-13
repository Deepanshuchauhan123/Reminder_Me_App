import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Baseauth {
  Future<String> signInWithEmailandpassword(String email, String password);
  Future<String> createUserwithemailandpassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements Baseauth {
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  Future<String> signInWithEmailandpassword(
      String email, String password) async {
    FirebaseUser user = (await _firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password))
        .user;

    return user.uid;
  }

  Future<String> createUserwithemailandpassword(
      String email, String password) async {
    FirebaseUser user = (await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password))
        .user;
    return user.uid;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
