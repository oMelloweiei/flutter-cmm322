import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  Map<String, dynamic> item;
  OnboardingPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/onboarding/${item['image']}',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * 0.8,
        ),
        SizedBox(height: 20),
        Text(
          item['head'] as String,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        SizedBox(height: 20),
        Container(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Text(
              item['detail'] as String,
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
