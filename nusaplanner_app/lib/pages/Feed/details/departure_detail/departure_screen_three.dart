import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/departure_detail/departure_screen_four.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail/visa_screen_three.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class DepartureScreenThree extends StatefulWidget {
  const DepartureScreenThree({Key? key}) : super(key: key);

  @override
  State<DepartureScreenThree> createState() => _DepartureScreenThreeState();
}

class _DepartureScreenThreeState extends State<DepartureScreenThree> {
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
              textTop: "Choosing",
              textBottom: "an Airline",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xff4361EE,
              colorValueTwo: 0xffCAE6FF,
            ),
            Center(
              child: Text(
                '3. Which airline?',
                style: blackSemiBoldTextStyle.copyWith(fontSize: spaceToHeader),
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
                  Text(
                    'This part is considered important, because you are going to spend 12+ hours on the plane and also several hours of transit.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The airlines that are most in demand are middle eastern airlines due to the its offered price, which is quite cheap for flights with five-star rate. The list of the airlines are written below:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.qatarairways.com/en-de/homepage.html';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      '- Qatar Airways',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url = 'https://www.etihad.com/en-us/';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      '- Etihad',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url = 'https://www.emirates.com/de/german/';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      '- Emirates',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The other favorite airlines are worth mentioning as well:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url = 'https://www.turkishairlines.com/';

                      openBrowserURLs(url: url, inApp: false);
                    },
                    child: Text(
                      '- Turkish Airlines',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url = 'https://www.koreanair.com/us/en';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      '- Korean Air',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.singaporeair.com/en_UK/de/home#/book/bookflight';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      '- Singapore Airlines',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'These are the suggested airlines. For the purchasing, we leave it to you.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
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
                      "Fly Overview",
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
                        return DepartureScreenFour();
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
