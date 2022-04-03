import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuth {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<String> getUser();
  Future<bool> isSingedIn();
}

class UserAuth implements IAuth {
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
        throw Exception("Password is too weack");
      } else if (e.code == 'email-already-in-use') {
        throw Exception("This email isn not available");
      }
    } catch (e) {
      throw Exception(e);
    }
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
      if (e.code == 'invalid-password') {
        throw Exception("Invalid password");
      } else if (e.code == 'invalid-email') {
        throw Exception("Invalid email");
      }
    } catch (e) {
      throw Exception(e);
    }
    return user;
  }

  @override
  Future<String> getUser() async {
    final currentUser = auth.currentUser;
    return currentUser.uid;
  }

  @override
  Future<bool> isSingedIn() async {
    final user = auth.currentUser;
    return user != null;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
