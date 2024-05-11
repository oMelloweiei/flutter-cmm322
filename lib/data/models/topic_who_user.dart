import 'package:cloud_firestore/cloud_firestore.dart';

class UserwithTopicModel {
  final String topicId;
  final String userId;

  UserwithTopicModel({required this.topicId, required this.userId});

  Map<String, dynamic> toJson() {
    return {
      'topic_id': topicId,
      'user_id': userId,
    };
  }

  factory UserwithTopicModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserwithTopicModel(
        topicId: data['topic_id'] as String, userId: data['user_id'] as String);
  }
}
