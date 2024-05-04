import 'package:binny_application/data/models/user/userModel.dart';
import 'package:binny_application/utils/exceptions/firebase_exception.dart';
import 'package:binny_application/utils/exceptions/platform_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } on Exception catch (e) {
      // Check if the exception is a platform-specific error
      if (e is PlatformException) {
        throw TPlatformException(e.code);
      } else {
        throw "Something went wrong. Please try again";
      }
    }
  }
}
