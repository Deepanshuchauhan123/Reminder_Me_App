import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class Baseauth {
  Future<String> signInWithEmailandpassword(String email, String password);
  Future<String> createUserwithemailandpassword(String email, String password);
  Future<String> currentUser();
}

class Auth implements Baseauth {
  Future<String> signInWithEmailandpassword(
      String email, String password) async {
    FirebaseUser user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password))
        .user;

    return user.uid;
  }

  Future<String> createUserwithemailandpassword(
      String email, String password) async {
    FirebaseUser user = (await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }
  Future<String> currentUser() async{
    FirebaseUser user= await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
}
