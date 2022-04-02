import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuth {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class Auth implements IAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  @override
  Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = credential.user;
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log(1);
      } else if (e.code == 'email-already-in-use') {
        log(1);
      }
      // ignore: empty_catches
    } catch (e) {}
    return user;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log(1);
      } else if (e.code == 'email-already-in-use') {
        log(1);
      }
    } catch (e) {
      log(1);
    }
    return user;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
