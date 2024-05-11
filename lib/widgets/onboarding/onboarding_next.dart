import 'package:binny_application/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50,
        right: 30,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), backgroundColor: Colors.white),
            onPressed: () => OnBoardingController.instance.nextPage(),
            child: Icon(Icons.arrow_forward_ios_rounded)));
  }
}
