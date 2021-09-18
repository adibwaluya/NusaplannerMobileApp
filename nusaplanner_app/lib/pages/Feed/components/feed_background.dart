import 'package:flutter/material.dart';

class FeedBackground extends StatelessWidget {
  final Widget child;
  const FeedBackground({Key? key, required this.child}) : super(key: key);

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
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/shapes/darkBlue_ellipse_top_feed.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            top: 431,
            left: 0,
            child: Image.asset(
              "assets/shapes/darkBlue_rectangle_feed(1).png",
              width: size.width * 0.3,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
