import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilearn/models/student.dart';

class StudentDatabaseService {
  final String uid;
  StudentDatabaseService({this.uid = ''});

  final CollectionReference<Map<String, dynamic>> participant =
      FirebaseFirestore.instance.collection('student');

  Future checkUserData(
      {required String username,
      required String mail,
      String? phoneNum,
      String? organization,
      int? age}) async {
    var checkCustomer = await participant.doc(uid).get();
    if (!checkCustomer.exists) {
      updateUserData(
        username: username,
        phoneNum: phoneNum ?? '',
        mail: mail,
        organization: organization ?? '',
      );
    }
  }

// Push Data
  Future updateUserData({
    String? username,
    String? mail,
    String? phoneNum,
    String? organization,
  }) async {
    await participant.doc(uid).set({
      'username': username,
      'mail': mail,
      'phoneNum': phoneNum,
      'organization': organization,
    });
  }

// Pull Data
  StudentData _participantDataFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return StudentData(
      uid: uid,
      name: snapshot.data()!['username'],
      mail: snapshot.data()!['mail'],
      phoneNum: snapshot.data()!['phoneNum'],
      organization: snapshot.data()!['organization'],
    );
  }
}
