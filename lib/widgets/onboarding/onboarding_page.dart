import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/widgets/class/Color.dart';

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
          style: TextStyle(fontSize: 24, color: Ticolor.whiteMain1),
        ),
        SizedBox(height: 20),
        Container(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Text(
              item['detail'] as String,
              style: TextStyle(fontSize: 16, color: Ticolor.whiteMain1),
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
