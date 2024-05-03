import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            )
          ],
        ),
      )),
    );
  }
}
