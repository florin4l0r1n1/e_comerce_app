import 'package:e_comerce_app/data/auth/user_aut.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:async';

class AuthRepository {
  final _userAuth = UserAuth();
  Future<User> registerUser(String email, String password) async {
    return await _userAuth.registerWithEmailAndPassword(email, password);
  }

  Future<User> signIn(String email, String password) async {
    return await _userAuth.signInWithEmailAndPassword(email, password);
  }

  Future<void> signOut() {
    return _userAuth.signOut();
  }

  Future<bool> isSingedIn() async {
    return await _userAuth.isSingedIn();
  }

  Future<String> getUser() async {
    return await _userAuth.getUser();
  }
}
