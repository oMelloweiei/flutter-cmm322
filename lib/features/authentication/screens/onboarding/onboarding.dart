import 'package:binny_application/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:binny_application/widgets/onboarding/onboarding_nav.dart';
import 'package:binny_application/widgets/onboarding/onboarding_next.dart';
import 'package:binny_application/widgets/onboarding/onboarding_page.dart';
import 'package:binny_application/widgets/onboarding/onboarding_skip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final _onboardItem = [
    {
      'head': 'ติดต่อขายขยะ',
      'detail': 'สามารถสร้างรายได้เพิ่มเติมจากการขายขยะที่ไม่ใช้แล้ว',
      'image': 'contact.png'
    },
    {
      'head': 'คู่มือการแยกขยะ',
      'detail': 'คู่มือแยกขยะสามารถช่วยให้ทิ้งขยะลงถังได้ถูกประเภท',
      'image': 'bin.png'
    },
    {
      'head': 'สะสมแต้มแลกของ',
      'detail': 'แต้มสะสมจากการขายขยะสามารถนำไปแลกของได้',
      'image': 'reward.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF02C275), Color(0xFFFFFFFF)],
              ),
            ),
          ),
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: List.generate(_onboardItem.length,
                (index) => OnboardingPage(item: _onboardItem[index])),
          ),
          OnboardingSkip(),
          OnboardingNavigation(
            onboardItems: _onboardItem,
          ),
          OnboardingNext()
        ],
      ),
    );
  }
}
