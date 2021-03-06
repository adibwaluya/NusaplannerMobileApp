import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nusaplanner_app/pages/plan/plan_page.dart';
import '../theme.dart';

class MyHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  final bool iconleft;
  final int colorValueOne;
  final int colorValueTwo;
  const MyHeader(
      {Key? key,
      required this.image,
      required this.textTop,
      required this.textBottom,
      required this.offset,
      required this.iconleft,
      required this.colorValueOne,
      required this.colorValueTwo})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 45, right: 20),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(widget.colorValueOne),
              Color(widget.colorValueTwo),
            ],
          ),
        ),
        child: widget.iconleft
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: (widget.offset < 0) ? 0 : widget.offset,
                          child: Image.asset(
                            widget.image,
                            width: 220,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Positioned(
                          top: 35 - widget.offset / 2,
                          left: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "${widget.textTop} \n${widget.textBottom}",
                              style: blackSemiBoldTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(), //required
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PlanPage();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: (widget.offset < 0) ? 0 : widget.offset,
                          child: Image.asset(
                            widget.image,
                            width: 230,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        SizedBox(width: 20),
                        Positioned(
                          top: 15 - widget.offset / 2,
                          left: 240,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              "${widget.textTop} \n${widget.textBottom}",
                              style: blackSemiBoldTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(), // required
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
