// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/services/database.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _userFromFireBase(User user) {
    return UserModel(uid: user.uid);
  }

  Stream<UserModel> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFireBase(user!));
  }

  Future signUpUsingEmail(email, password,
      {String? username, String? organization, String? expertise}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      StudentDatabaseService(uid: user!.uid).updateUserData(
        username: username,
        phoneNum: '',
        mail: email,
        organization: organization,
      );
      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInUsingMail(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFireBase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
