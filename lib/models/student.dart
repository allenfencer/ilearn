class StudentData {
  final String uid;
  final String username;
  final String mail;
  final String phoneNum;
  final String organization;

  final String about;
  final int streak;

  final int credits;
  // final List<String> certificates;

  StudentData({
    required this.uid,
    required this.mail,
    required this.username,
    required this.organization,
    required this.phoneNum,
    required this.about,
    required this.streak,
    required this.credits,
    // required this.certificates,
  });
}

class StudentDataModel {
  final String uid;
  final String username;
  final String mail;
  final String phoneNum;
  final String organization;

  final String about;
  final int streak;

  final int credits;
  // final List<String> certificates;

  StudentDataModel({
    required this.uid,
    required this.mail,
    required this.username,
    required this.organization,
    required this.phoneNum,
    required this.about,
    required this.streak,
    required this.credits,
    // required this.certificates,
  });
}
