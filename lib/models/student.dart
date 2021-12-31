class StudentData {
  final String uid;
  final String name;
  final String mail;
  final String phoneNum;
  final String organization;

  StudentData({
    required this.uid,
    required this.mail,
    required this.name,
    required this.organization,
    required this.phoneNum,
  });
}

class ParticipantDataModel {
  final String uid;
  final String username;
  final String mail;
  final String phoneNum;
  final String organization;

  ParticipantDataModel({
    required this.uid,
    required this.mail,
    required this.username,
    required this.organization,
    required this.phoneNum,
  });
}
