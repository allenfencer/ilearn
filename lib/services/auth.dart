import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ilearn/models/user.dart';
import 'package:ilearn/services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  late String uid;
  UserModel _userFromFireBase(User user) {
    return UserModel(uid: user.uid);
  }

  Stream<UserModel> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFireBase(user!));
  }

  Future signInUsingGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await _auth.signInWithCredential(authCredential);
      User? user = result.user;
      StudentDatabaseService(uid: user!.uid).checkUserData(
        username: user.displayName!,
        mail: user.email!,
      );
      uid = user.uid;
      return _userFromFireBase(user);
    } catch (e) {
      Get.snackbar('Error', e.toString().replaceAll('firebase', 'Auth'));
      return null;
    }
  }

  Future signUpUsingEmail(email, password, {String? username}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      StudentDatabaseService(uid: user!.uid).updateUserData(
        username: username,
        mail: email,
      );

      uid = user.uid;
      return _userFromFireBase(user);
    } catch (e) {
      Get.snackbar(
          'Error Registering', e.toString().replaceAll('firebase', 'Auth'));
      return null;
    }
  }

  Future signInUsingMail(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      uid = user!.uid;
      return _userFromFireBase(user);
    } catch (e) {
      Get.snackbar(
          'Error Logging In', e.toString().replaceAll('firebase', 'Auth'));
      return null;
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar(
          'Error Signing Out', e.toString().replaceAll('firebase', 'Auth'));
      return null;
    }
  }
}
