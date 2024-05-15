import 'package:cloud_firestore/cloud_firestore.dart';

class TopicModel {
  final String id;
  int likeCount;
  int replyCount;
  List<String>? replyId;
  String text;
  DateTime timeStamp;
  String userId;
  String profilePic;
  String userName;

  TopicModel(
      {required this.id,
      required this.likeCount,
      required this.replyCount,
      this.replyId,
      required this.text,
      required this.timeStamp,
      required this.userId,
      required this.profilePic,
      required this.userName});

  //get user who have topic_id from UserModel and user_id from TopicModel

  // Empty Post Function
  static TopicModel empty() => TopicModel(
      id: '',
      likeCount: 0,
      replyCount: 0,
      replyId: [],
      text: '',
      timeStamp: DateTime(0),
      userId: '',
      profilePic: '',
      userName: '');

  //Convert model to json structure so that you can store data in firestore
  Map<String, dynamic> toJson() {
    return {
      'like_count': likeCount,
      'reply_count': replyCount,
      'reply_id': replyId,
      'text': text,
      'time': timeStamp,
      'user_id': userId,
      'Proflie_pic': profilePic,
      'user_name': userName
    };
  }

  //Map Json oriented document snapshot from firestore to TopicModel
  factory TopicModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      DateTime timeStamp =
          data['time'] != null ? data['time'].toDate() : DateTime.now();
      return TopicModel(
          id: document.id,
          likeCount: data['like_count'] ?? 0,
          replyCount: data['reply_count'] ?? 0,
          replyId: List<String>.from(data['reply_id'] ?? []),
          text: data['text'] ?? '',
          timeStamp: timeStamp,
          userId: data['user_id'] ?? '',
          profilePic: data['Proflie_pic'] ?? '',
          userName: data['user_name'] ?? '');
    } else {
      return TopicModel.empty();
    }
  }
}
