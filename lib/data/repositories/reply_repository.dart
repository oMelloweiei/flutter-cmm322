import 'package:binny_application/data/models/replyModel.dart';
import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/utils/exceptions/firebase_exception.dart';
import 'package:binny_application/utils/exceptions/platform_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ReplyRepository extends GetxController {
  static ReplyRepository get instance => Get.find();

  // Variable
  final _db = FirebaseFirestore.instance;

  //Get replies for topic
  Future<List<ReplyModel>> getRepliesForTopic(String topicId) async {
    try {
      // my subcolecttion is Replies
      final snapshot = await _db
          .collection('Topics')
          .doc(topicId)
          .collection('Replies')
          .get();

      final list = snapshot.docs
          .map((document) => ReplyModel.fromSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print(e);
      throw "Something went wrong. Please try again $e";
    }
  }

  //Upload topic to the cloud firestore
}
