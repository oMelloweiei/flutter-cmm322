import 'package:binny_application/data/models/user/userModel.dart';
import 'package:binny_application/data/repositories/authentication_repository.dart';
import 'package:binny_application/data/repositories/user/user_repository.dart';
import 'package:binny_application/features/authentication/screens/verify_email/verify_email.dart';
import 'package:binny_application/network_manager.dart';
import 'package:binny_application/utils/popups/full_screen_loader.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidepassword = true.obs;
  final hideconfirmpassword = true.obs;
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///-SignUp
  void signup() async {
    try {
      FullScreenLoader.openLoadingDialog('We are processing your information',
          'https://lottie.host/4ebfe8ac-255b-4829-b23f-476f392d51d1/KeNyd5hAit.json');

      //Form validation
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy Check

      //Register user in the Firebase Authentication & Save user data in the Firebase
      UserCredential userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save Authentication user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstname: firstname.text.trim(),
          lastname: lastname.text.trim(),
          email: email.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(
          newUser); // Make sure to await the saveUserRecord method

      //Remove loader
      FullScreenLoader.stopLoading();

      //Show success
      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      //Move to verify email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}
