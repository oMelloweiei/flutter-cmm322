import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:binny_application/widgets/class/Color.dart';

class Loaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Ticolor.no,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Ticolor.blackSup1),
          child: Center(
            child: Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
          ),
        )));
  }

  static successSnackBar({required String title, String message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Ticolor.whiteMain1,
        backgroundColor: Ticolor.greenMain10,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(10),
        icon: FaIcon(
          FontAwesomeIcons.check,
          color: Ticolor.whiteMain1,
        ));
  }

  static warningSnackBar({required String title, String message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Ticolor.whiteMain1,
        backgroundColor: Ticolor.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(20),
        icon: FaIcon(
          FontAwesomeIcons.bell,
          color: Ticolor.whiteMain1,
        ));
  }

  static errorSnackBar({required String title, String message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Ticolor.whiteMain1,
        backgroundColor: Ticolor.redSup2,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(20),
        icon: FaIcon(
          FontAwesomeIcons.bell,
          color: Ticolor.whiteMain1,
        ));
  }
}
