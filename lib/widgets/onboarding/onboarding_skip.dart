import 'package:binny_application/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50,
        left: 30,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey[700], fontSize: 16),
            )));
  }
}
