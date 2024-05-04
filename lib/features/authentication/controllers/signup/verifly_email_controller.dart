import 'dart:async';

import 'package:binny_application/data/repositories/authentication_repository.dart';
import 'package:binny_application/features/authentication/screens/signup/widgets/success.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
          title: "Email Sent",
          message: "Please check your inbox and verify your email");
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Timer to autotically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image:
                'https://lottie.host/b3785379-65ae-4555-9277-321c4d033d16/6OTlnQ3iw2.json',
            title: 'Your account has been created',
            subTitle: 'Your account has been created subtitle',
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  //Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image:
              'https://lottie.host/b3785379-65ae-4555-9277-321c4d033d16/6OTlnQ3iw2.json',
          title: 'Your account has been created',
          subTitle: 'Your account has been created subtitle',
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
