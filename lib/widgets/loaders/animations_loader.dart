import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget({
    Key? key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onPressedAction,
  }) : super(key: key);

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onPressedAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onPressedAction,
                    style: OutlinedButton.styleFrom(),
                    child: Text(
                      actionText!,
                    ),
                  ))
              : SizedBox()
        ],
      ),
    );
  }
}
