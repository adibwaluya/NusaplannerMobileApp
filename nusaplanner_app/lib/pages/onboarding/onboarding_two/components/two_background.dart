import 'package:flutter/material.dart';

class OnboardingTwoBackground extends StatelessWidget {
  final Widget child;
  const OnboardingTwoBackground({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "assets/shapes/darkBlue_rectangle_signup.png",
              width: size.width * 0.2,
            ),
          ),
          Positioned(
            left: 78,
            child: Image.asset(
              "assets/shapes/blue_rectangle_signup.png",
              width: size.width * 0.1,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
