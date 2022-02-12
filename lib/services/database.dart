import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ilearn/models/certrificate.dart';
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
    List<String>? certificates,
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

// Push User Data
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

// Pull User Data
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

// Push Certificate Data
  Future updateCertificateData(
      {required String certificateUrl, required String course}) async {
    await student.doc(uid).update({
      'credits': FieldValue.increment(100),
    });
    await student.doc(uid).collection('certificate').doc(course).set({
      'certificate_url': certificateUrl,
      'course': course,
      'date_time': DateTime.now()
    });
  }

// Pull Certificate Data
  List<CertificateModel> certificateList(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      return CertificateModel(
          certificateUrl: doc.data()!['certificate_url'],
          course: doc.data()!['course'],
          dateTime: doc.data()!['date_time']);
    }).toList();
  }

// Push Streak Data
  Future updateStreakData(
      {required String postUrl, required String desc}) async {
    await student.doc(uid).collection('streak').doc().set({
      'post_url': postUrl,
      'description': desc,
      'date_time': DateTime.now()
    });
  }

  Stream<StudentData> get studentDataStream {
    return student.doc(uid).snapshots().map(studentDataFromSnapshot);
  }

  Stream<List<CertificateModel>> get certificateDataStream {
    return student
        .doc(uid)
        .collection('certificate')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(certificateList);
  }
}
