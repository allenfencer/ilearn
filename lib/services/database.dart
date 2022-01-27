import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilearn/models/student.dart';

class StudentDatabaseService {
  final String uid;
  StudentDatabaseService({this.uid = ''});

  final CollectionReference<Map<String, dynamic>> participant =
      FirebaseFirestore.instance.collection('student');

  Future checkUserData({
    required String username,
    required String mail,
    String? phoneNum,
    String? organization,
    int? age,
    String? about,
    int? streak,
    int? credits,
    List<String>? certificates,
  }) async {
    var checkCustomer = await participant.doc(uid).get();
    if (!checkCustomer.exists) {
      updateUserData(
        username: username,
        phoneNum: phoneNum ?? '',
        mail: mail,
        organization: organization ?? '',
        about: about ?? '',
        streak: streak ?? 0,
        credits: 0,
        certificates: certificates ?? [],
      );
    }
  }

// Push Data
  Future updateUserData({
    String? username,
    String? mail,
    String? phoneNum,
    String? organization,
    String? about,
    int? streak,
    int? credits,
    List<String>? certificates,
  }) async {
    await participant.doc(uid).set({
      'username': username,
      'mail': mail,
      'phoneNum': phoneNum,
      'organization': organization,
      'about': about,
      'streak': streak,
      'credits': credits,
      'certificates': certificates,
    });
  }

// Pull Data
  StudentData participantDataFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return StudentData(
      uid: uid,
      name: snapshot.data()!['username'],
      mail: snapshot.data()!['mail'],
      phoneNum: snapshot.data()!['phoneNum'],
      organization: snapshot.data()!['organization'],
      about: snapshot.data()!['about'],
      streak: snapshot.data()!['streak'],
      credits: snapshot.data()!['credits'],
      certificates: snapshot.data()!['certificates'],
    );
  }

  Stream<StudentData> get customerData {
    return participant.doc(uid).snapshots().map(participantDataFromSnapshot);
  }
}
