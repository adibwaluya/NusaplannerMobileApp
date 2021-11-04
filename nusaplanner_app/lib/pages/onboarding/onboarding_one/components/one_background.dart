import 'package:flutter/material.dart';

class OnboardingOneBackground extends StatelessWidget {
  final Widget child;
  const OnboardingOneBackground({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Image.asset("assets/shapes/blue_rectangle_one.png",
                width: size.width * 1),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset("assets/images/Mahasiswa.png",
                width: size.width * 0.5),
          ),
          child,
        ],
      ),
    );
  }
}
