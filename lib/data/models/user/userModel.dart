import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String email;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.profilePicture,
  });

  String get fullName => '$firstname $lastname';

  static List<String> nameParts(fullName) => fullName.split(' ');

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstname = nameParts[0].toLowerCase();
    String lastname = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = '$firstname$lastname';
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
        id: '',
        firstname: '',
        lastname: '',
        email: '',
        profilePicture: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstname,
      'LastName': lastname,
      'Email': email,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      return UserModel(
        id: document.id,
        firstname: data?['FirstName'] ?? '',
        lastname: data?['LastName'] ?? '',
        email: data?['Email'] ?? '',
        profilePicture: data?['ProfilePicture'] ?? '',
      );
    }
    throw ArgumentError('Invalid document snapshot');
  }
}
