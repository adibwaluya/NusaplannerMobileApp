import 'package:flutter/material.dart';

class PlanBackground extends StatelessWidget {
  final Widget child;
  const PlanBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/shapes/Ellipse_planning_bg.png',
              width: size.width * 1,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
