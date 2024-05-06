import 'package:binny_application/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class googleBTN extends StatelessWidget {
  const googleBTN({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16),
      ),
      onPressed: () => controller.googleSignIn(),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/icons/google.png',
              fit: BoxFit.cover,
              height: 25,
            ),
            SizedBox(width: 5),
            Text(
              'Google',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ])),
    );
  }
}
