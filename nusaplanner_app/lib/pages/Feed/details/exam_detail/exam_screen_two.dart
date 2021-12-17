import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/exam_detail/exam_screen_three.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class ExamScreenTwo extends StatelessWidget {
  const ExamScreenTwo({Key? key}) : super(key: key);

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
              image: "assets/images/departure_two.png",
              textTop: "Studienkolleg",
              textBottom: "Types",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF51087E,
              colorValueTwo: 0xFFD7A1F9,
            ),
            Center(
              child: Text(
                '2. Type of Studienkolleg?',
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
                        text:
                            'Before getting to know the courses in Studienkolleg, you firstly need to know a few general things regarding Studienkolleg. For example: ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'Studienkollegs at a university (Universität) or a university of applied sciences (Hochschule).',
                            style:
                                blackSemiBoldTextStyle.copyWith(fontSize: 16),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'They are either affiliated with a university or a university of applied sciences. If you have successfully passed the final exam at:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. a university Studienkolleg...',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'you can subsequently study at a university or at a university of applied sciences',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '2. a university of applied sciences Studienkolleg...',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'you are usually not qualified to study at a university, but can only study at a university of applied sciences.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'There are also ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'State-run and Private Studienkollegs.',
                            style:
                                blackSemiBoldTextStyle.copyWith(fontSize: 16),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                        text: '1. State-run Studienkollegs ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'are usually tuition-free and their degree is usually valid to study anywhere in Germany.',
                            style: blackLightTextStyle.copyWith(fontSize: 14),
                          ),
                        ]),
                  ),
                  SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                        text: '2. Private Studienkollegs ',
                        style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'often charge tuition and it is important that you find out whether the private Studienkolleg you wish to study at even offers a certificate which is valid in all of Germany.',
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
                        return ExamScreenThree();
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
