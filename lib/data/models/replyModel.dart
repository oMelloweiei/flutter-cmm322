import 'package:cloud_firestore/cloud_firestore.dart';

class ReplyModel {
  final String id;
  String text;
  String topicId;
  String userId;
  String username;
  String profilePic;

  ReplyModel({
    required this.id,
    required this.text,
    required this.topicId,
    required this.userId,
    required this.username,
    required this.profilePic,
  });

  static ReplyModel empty() => ReplyModel(
      id: '', text: '', topicId: '', userId: '', username: '', profilePic: '');

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'topic_id': topicId,
      'user_id': userId,
      'user_name': username,
      'profile_pic': profilePic
    };
  }

  factory ReplyModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ReplyModel(
        id: document.id,
        text: data['text'] ?? '',
        topicId: data['topic_id'] ?? '',
        userId: data['user_id'] ?? '',
        username: data['user_name'] ?? '',
        profilePic: data['profile_pic'] ?? '',
      );
    } else {
      return ReplyModel.empty();
    }
  }
}
