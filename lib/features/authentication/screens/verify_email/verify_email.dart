import 'package:binny_application/data/repositories/authentication_repository.dart';
import 'package:binny_application/features/authentication/controllers/signup/verifly_email_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key, this.email});

  String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
          onPressed: () => AuthenticationRepository.instance.logout(),
          icon: const Icon(CupertinoIcons.clear),
        )
      ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image(
              image: AssetImage(
                  "https://lottie.host/49c834d6-7903-4946-9da8-4a32db990768/ppqKDPSfeb.json"),
              width: MediaQuery.of(context).size.height * 0.6,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Confirm Email',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              email ?? '',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Confirm Email title',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => controller.checkEmailVerificationStatus(),
                child: const Text('Continues')),
            SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text('Resend Email')))
          ],
        ),
      )),
    );
  }
}
