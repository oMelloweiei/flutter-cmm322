import 'package:binny_application/features/authentication/screens/onboarding/onboarding.dart';
import 'package:binny_application/features/authentication/screens/verify_email/verify_email.dart';
import 'package:binny_application/pages/homepage.dart';
import 'package:binny_application/utils/exceptions/firebase_auth_exception.dart';
import 'package:binny_application/utils/exceptions/firebase_exception.dart';
import 'package:binny_application/utils/exceptions/platform_exception.dart';
import 'package:binny_application/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Call from main.dart an app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Funtion to show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const HomePage());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(const WelcomePage())
          : Get.offAll(OnBoardingScreen());
    }

    //Debug
    // if (kDebugMode) {
    //   print("====================================================");
    //   print("Go to HomePage");
    // }
  }

  /*--------------------------- Email & Password sign-in ----------------------------*/

  //Email Authentication - SignIn

  //Email Authentication - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw "Somethins went wrong. Please try again";
    }
  }

  //Email Authentication - Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw "Somethins went wrong. Please try again";
    }
  }

/*------------------------------ ./end Federated identity & social sign-in ----------------------------------*/
  //Logout - Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw "Somethins went wrong. Please try again";
    }
  }
}
