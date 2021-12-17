import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/exam_detail/exam_screen_four.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class ExamScreenThree extends StatelessWidget {
  const ExamScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyHeader(
              image: "assets/images/departure_three.png",
              textTop: "Studienkolleg",
              textBottom: "Courses",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF51087E,
              colorValueTwo: 0xFFD7A1F9,
            ),
            Center(
              child: Text(
                '3. Courses in Studienkolleg',
                style: blackSemiBoldTextStyle.copyWith(fontSize: spaceIconText),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                        text: 'The University Studienkollegs ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'offer the following specialised courses as preparation for studying at university:',
                            style: blackLightTextStyle.copyWith(fontSize: 16),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                        text: 'M - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'for medical, biological and pharmaceutical degrees',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'T - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'for mathematical, science or technical degrees',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'W - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'for business, economics and social science degrees',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'G - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'for humanity degrees or German studies',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'S - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'for language degrees',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                        text:
                            'The University of Applied Sciences Studienkollegs ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'offer the following specialised courses as preparation for studying:',
                            style: blackLightTextStyle.copyWith(fontSize: 16),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'TI - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'for technical and engineering degrees',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'WW - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'for economics and business degrees',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'GD - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'for design and art degrees',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'SW - Course: ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'for social science degrees',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Back",
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(whiteColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(darkPurpleColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      /* Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => VisaScreenOne()),
                          (route) => false); */
                    },
                    child: Text(
                      "Course Overview",
                      style: whiteTextStyle.copyWith(fontSize: 14),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(whiteColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(darkPurpleColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ExamScreenFour();
                      }));
                    },
                    child: Text(
                      "Next",
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(whiteColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(darkPurpleColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Future openBrowserURLs({required String url, bool inApp = false}) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: inApp, enableJavaScript: inApp);
    }
  }
}
