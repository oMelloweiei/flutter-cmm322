import 'package:binny_application/data/models/userModel.dart';
import 'package:binny_application/data/repositories/authentication_repository.dart';
import 'package:binny_application/data/repositories/user_repository.dart';
import 'package:binny_application/features/authentication/screens/verify_email/verify_email.dart';
import 'package:binny_application/network_manager.dart';
import 'package:binny_application/utils/popups/full_screen_loader.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidepassword = true.obs;
  final hideconfirmpassword = true.obs;
  final email = TextEditingController();
  final firstname = TextEditingController();
  final username = TextEditingController();
  final lastname = TextEditingController();
  final password = TextEditingController();
  final number = TextEditingController();
  final confirmpassword = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///-SignUp
  void signup() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'We are processing your information', 'assets/lottie/loading.json');

      print("Signup Button Pressed");

      //Form validation
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        print("No Internet Connection");
        return;
      }

      //Form validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        print("Form Validation Failed");
        return;
      }

      //Privacy Policy Check

      //Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save Authentication user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstname: firstname.text.trim(),
        username: username.text.trim(),
        lastname: lastname.text.trim(),
        email: email.text.trim(),
        profilePicture: '',
        number: number.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove loader
      FullScreenLoader.stopLoading();

      //Show success
      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      //Move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // FullScreenLoader.stopLoading();
    }
  }
}
