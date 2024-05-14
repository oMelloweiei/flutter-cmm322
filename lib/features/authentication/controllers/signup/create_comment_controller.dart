import 'package:binny_application/data/models/replyModel.dart';
import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/data/models/userModel.dart';
import 'package:binny_application/data/repositories/reply_repository.dart';
import 'package:binny_application/network_manager.dart';
import 'package:binny_application/utils/popups/full_screen_loader.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCommentController extends GetxController {
  static CreateCommentController get instance => Get.find();

  ///Variables

  final comment = TextEditingController();

  GlobalKey<FormState> createCommentKey = GlobalKey<FormState>();

  // SignUp
  void creatcomment(UserModel user, TopicModel topic) async {
    try {
      // FullScreenLoader.openLoadingDialog(
      //     'We are processing your information', 'assets/lottie/loading.json');

      //Form validation
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        print("No Internet Connection");
        return;
      }

      //Form validation
      if (!createCommentKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        print("Form Validation Failed");
        return;
      }

      final DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref().child('comments');
      final newCommentRef = databaseReference.push();

      //Save Authentication user data in the Firebase Firestore
      final newComment = ReplyModel(
        id: newCommentRef.key!,
        text: comment.text,
        topicId: topic.id,
        userId: user.id,
        username: user.username,
        profilePic: user.profilePicture,
      );

      final replyRepository = Get.put(ReplyRepository());
      await replyRepository.saveReplyRecord(newComment);

      //Remove loader
      // FullScreenLoader.stopLoading();

      //Show success
      // Loaders.successSnackBar(
      //     title: 'Congratulations',
      //     message: 'Your account has been created! Verify email to continue');

      //Move to verify comment screen
      // Get.to(() => katooPage());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // FullScreenLoader.stopLoading();
    }
  }
}
