import 'package:binny_application/utils/format/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String username;
  String firstname;
  String lastname;
  String email;
  String profilePicture;
  String number;
  String? address;
  int? point;
  int? following;
  int? follower;
  int? plastic;
  int? aluminium;
  int? drinkbox;
  int? oil;
  String? topicId;
  String? replyId;
  List<String>? historyId;

  UserModel({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.profilePicture,
    required this.number,
    this.address,
    this.point,
    this.following,
    this.follower,
    this.plastic,
    this.aluminium,
    this.drinkbox,
    this.oil,
    this.topicId,
    this.replyId,
    this.historyId,
  });

  String get fullName => '$firstname $lastname';

  String get formattedPhoneNO => Formatter.formatPhoneNumber(number);

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
      username: '',
      firstname: '',
      lastname: '',
      email: '',
      profilePicture: '',
      number: '',
      address: '',
      point: 0,
      following: 0,
      follower: 0,
      plastic: 0,
      aluminium: 0,
      drinkbox: 0,
      oil: 0,
      topicId: '',
      replyId: '',
      historyId: []);

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstname,
      'UserName': username,
      'LastName': lastname,
      'Email': email,
      'ProfilePicture': profilePicture,
      'Number': number,
      'Address': address,
      'Point': point,
      'Following': following,
      'Follower': follower,
      'Plastic': plastic,
      'Aluminium': aluminium,
      'Drinkbox': drinkbox,
      'Oil': oil,
      'TopicId': topicId,
      'ReplyId': replyId,
      'HistoryId': historyId
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        username: data['UserName'] ?? '',
        firstname: data['FirstName'] ?? '',
        lastname: data['LastName'] ?? '',
        email: data['Email'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        number: data['Number'] ?? '',
        address: data['Address'] ?? '',
        point: data['Point'] ?? 0,
        following: data['Following'] ?? 0,
        follower: data['Follower'] ?? 0,
        plastic: data['Plastic'] ?? 0,
        aluminium: data['Aluminium'] ?? 0,
        drinkbox: data['DrinkBox'] ?? 0,
        oil: data['Oil'] ?? 0,
        topicId: data['TopicId'],
        replyId: data['ReplyId'],
        historyId: List<String>.from(data['HistoryId'] ?? []),
      );
    } else {
      return UserModel.empty();
    }
  }
}
