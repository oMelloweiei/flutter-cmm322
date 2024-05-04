import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Lottie.asset(image,
                  width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                subTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed, child: const Text('Continue')))
            ],
          ),
        ),
      ),
    );
  }
}
