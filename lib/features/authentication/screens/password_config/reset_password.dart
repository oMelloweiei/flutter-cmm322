import 'package:binny_application/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:binny_application/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              //Image
              Lottie.asset('assets/lottie/checked.json',
                  width: MediaQuery.of(context).size.width * 0.8),
              const SizedBox(height: 10),

              //Email Title & SubTitle
              Text(
                email,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Password Reset Email Sent',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safety Change Your Password and Keep Your Account Safe.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const WelcomePage()),
                    child: const Text('Done')),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => ForgetPasswordController.instance
                        .resendPasswordResetEmail(email),
                    child: const Text('Resent Email')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
