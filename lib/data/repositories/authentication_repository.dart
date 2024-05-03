import 'package:binny_application/utils/exceptions/firebase_auth_exception.dart';
import 'package:binny_application/utils/exceptions/firebase_exception.dart';
import 'package:binny_application/utils/exceptions/platform_exception.dart';
import 'package:binny_application/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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
    //Debug
    if (kDebugMode) {
      print("====================================================");
      print("Go to HomePage");
    }

    //local storage
    Get.offAll(() => WelcomePage());
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
}
