import 'package:cloud_firestore/cloud_firestore.dart';

class ReplyModel {
  final String id;
  String text;
  String topicId;
  String userId;

  ReplyModel({
    required this.id,
    required this.text,
    required this.topicId,
    required this.userId,
  });

  static ReplyModel empty() =>
      ReplyModel(id: '', text: '', topicId: '', userId: '');

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'topic_id': topicId,
      'user_id': userId,
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
          userId: data['user_id'] ?? '');
    } else {
      return ReplyModel.empty();
    }
  }
}
