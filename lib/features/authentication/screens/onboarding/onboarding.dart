import 'package:binny_application/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController _controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller.pageController,
            itemCount: 3, // Number of onboarding pages
            onPageChanged: (index) {
              _controller.updatePageIndicator(index);
            },
            itemBuilder: (context, index) {
              // You can replace this with your custom onboarding pages
              return Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Onboarding Page ${index + 1}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3, // Number of dots
                  (index) => GestureDetector(
                    onTap: () => _controller.dotNavigationClick(index),
                    child: Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _controller.currentPageIndex.value == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => _controller.nextPage(),
                child: Text(
                  _controller.currentPageIndex.value == 2
                      ? 'Get Started'
                      : 'Next',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
