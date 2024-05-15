import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/data/models/userModel.dart';
import 'package:binny_application/data/repositories/topic_repository.dart';
import 'package:binny_application/network_manager.dart';
import 'package:binny_application/pages/comment.dart';
import 'package:binny_application/utils/popups/full_screen_loader.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  static CreatePostController get instance => Get.find();

  ///Variables

  final post = TextEditingController();

  GlobalKey<FormState> createFormKey = GlobalKey<FormState>();

  // SignUp
  void creatpost(UserModel user) async {
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
      if (!createFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        print("Form Validation Failed");
        return;
      }

      final DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref().child('topics');
      final newTopicRef = databaseReference.push();

      //Save Authentication user data in the Firebase Firestore
      final newTopic = TopicModel(
          id: newTopicRef.key!,
          likeCount: 0,
          replyCount: 0,
          replyId: [],
          text: post.text,
          timeStamp: DateTime.now(),
          userId: user.id,
          profilePic: user.profilePicture,
          userName: user.username);

      final topicRepository = Get.put(TopicRepository());
      await topicRepository.saveTopicRecord(newTopic);

      //Remove loader
      // FullScreenLoader.stopLoading();

      //Show success
      Loaders.successSnackBar(
          title: 'Congratulations', message: 'Your post has been created!');

      //Move to verify comment screen
      Get.to(() => katooPage());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // FullScreenLoader.stopLoading();
    }
  }
}
