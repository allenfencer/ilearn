import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilearn/models/student.dart';

class StudentDatabaseService {
  final String uid;
  StudentDatabaseService({this.uid = ''});

  final CollectionReference<Map<String, dynamic>> student =
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
    // List<String>? certificates,
  }) async {
    var checkStudent = await student.doc(uid).get();
    if (!checkStudent.exists) {
      updateUserData(
        username: username,
        phoneNum: phoneNum ?? '-',
        mail: mail,
        organization: organization ?? 'iLearn',
        about: about ?? 'iLearn User | Tech Enthusiast',
        streak: streak ?? 1,
        credits: 10,
        // certificates: certificates ?? [],
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
    // List<String>? certificates,
  }) async {
    await student.doc(uid).set({
      'username': username,
      'mail': mail,
      'phoneNum': phoneNum ?? '-',
      'organization': organization ?? 'iLearn',
      'about': about ?? 'iLearn User | Tech Enthusiast',
      'streak': streak ?? 1,
      'credits': 10,
      // 'certificates': certificates,
    });
  }

// Pull Data
  StudentData studentDataFromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return StudentData(
      uid: uid,
      username: snapshot.data()!['username'],
      mail: snapshot.data()!['mail'],
      phoneNum: snapshot.data()!['phoneNum'],
      organization: snapshot.data()!['organization'],
      about: snapshot.data()!['about'],
      streak: snapshot.data()!['streak'],
      credits: snapshot.data()!['credits'],
      // certificates: snapshot.data()!['certificates'],
    );
  }

  Stream<StudentData> get studentDataStream {
    return student.doc(uid).snapshots().map(studentDataFromSnapshot);
  }
}
