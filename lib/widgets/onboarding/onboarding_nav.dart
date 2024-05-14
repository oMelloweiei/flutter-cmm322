import 'package:binny_application/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:binny_application/widgets/class/Color.dart';

class OnboardingNavigation extends StatelessWidget {
  final List<Map<String, dynamic>> onboardItems;

  const OnboardingNavigation({
    Key? key,
    required this.onboardItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      left: 0,
      right: 0, // Set both left and right to 0 to center horizontally
      bottom: MediaQuery.of(context).size.height * 0.2,
      child: Center(
          child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: onboardItems.length,
        effect: ExpandingDotsEffect(
          activeDotColor: Ticolor.whiteMain1,
          dotHeight: 10,
          dotWidth: 12,
        ),
      )),
    );
  }
}
