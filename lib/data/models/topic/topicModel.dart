import 'package:cloud_firestore/cloud_firestore.dart';

class TopicModel {
  final String id;
  int likeCount;
  int replyCount;
  List<String>? replyId;
  String text;
  String timeStamp;
  String userId;

  TopicModel({
    required this.id,
    required this.likeCount,
    required this.replyCount,
    this.replyId,
    required this.text,
    required this.timeStamp,
    required this.userId,
  });

  static TopicModel empty() => TopicModel(
      id: '',
      likeCount: 0,
      replyCount: 0,
      replyId: [],
      text: '',
      timeStamp: '',
      userId: '');

  Map<String, dynamic> toJson() {
    return {
      'like_count': likeCount,
      'reply_count': replyCount,
      'reply_id': replyId,
      'text': text,
      'time': timeStamp,
      'user_id': userId,
    };
  }

  factory TopicModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return TopicModel(
          id: document.id,
          likeCount: data['like_count'] ?? 0,
          replyCount: data['reply_count'] ?? 0,
          replyId: List<String>.from(data['reply_id'] ?? []),
          text: data['text'] ?? '',
          timeStamp: data['time'] ?? '',
          userId: data['user_id'] ?? '');
    } else {
      return TopicModel.empty();
    }
  }
}
