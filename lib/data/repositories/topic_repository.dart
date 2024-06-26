import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/utils/exceptions/firebase_exception.dart';
import 'package:binny_application/utils/exceptions/platform_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TopicRepository extends GetxController {
  static TopicRepository get instance => Get.find();

  // Variable
  final _db = FirebaseFirestore.instance;

  //Get all topic
  Future<List<TopicModel>> getAllTopic() async {
    try {
      final snapshot = await _db.collection('Topics').get();
      final list = snapshot.docs
          .map((document) => TopicModel.fromSnapshot(document))
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

  Future<List<String>> getAllTopicIds() async {
    try {
      final snapshot = await _db.collection('Topics').get();
      final List<String> topicIds = snapshot.docs.map((doc) => doc.id).toList();
      return topicIds;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print(e);
      throw "Something went wrong. Please try again $e";
    }
  }

  Future<void> saveTopicRecord(TopicModel topic) async {
    try {
      await _db.collection("Topics").doc(topic.id).set(topic.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //Upload topic to the cloud firestore
}
