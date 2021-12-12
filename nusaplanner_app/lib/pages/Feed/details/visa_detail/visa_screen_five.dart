import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail/visa_screen_six.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class VisaScreenFive extends StatefulWidget {
  const VisaScreenFive({Key? key}) : super(key: key);

  @override
  State<VisaScreenFive> createState() => _VisaScreenFiveState();
}

class _VisaScreenFiveState extends State<VisaScreenFive> {
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
              image: "assets/images/visa_five.png",
              textTop: "Visa Application",
              textBottom: "Process",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF3383CD,
              colorValueTwo: 0xFF11249F,
            ),
            Center(
              child: Text(
                '4. Process...',
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
                    'So, you have all of previously mentioned documents, the primary documents on the first section, and copies of each of them? Nice! It is time to visit the embassy.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Now, we will walk you through the core process of the study preparation. These are the important steps you need to schedule:',
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
                  Text(
                    'a. Make an appointment ASAP!',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Firstly, you need to fill in the form from the link below and print out 2 exemplars of it:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://service2.diplo.de/rktermin/extern/choose_realmList.do?locationCode=jaka&request_locale=en';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Formular URL',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Q&A can be seen on website below:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://jakarta.diplo.de/id-de/service/-/1687542';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Q&A URL',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'b. Complete all of the necessary documents',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Make sure to complete all the previously mentioned documents. Put all of these documents into 1 folder. Lost documents or evidence may result in rejection of the application.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'c. What to do on the appointment day...',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'On the day of the appointment, show the Confirmation of the Appointment sent by the system in front of the entrance.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'd. The fee... the money...',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'For the fee, you can see the table below:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Table(
                    border: TableBorder.all(color: blackColor),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text('Adult (from 18 years old)',
                              style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '€ 70, -',
                            style: blackLightTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text('Minors (under 18)',
                              style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('€ 37,50 -',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'The fee will be paid in Rupiah cash at the embassy rate.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'e. Documents examination',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Documents are firstly reviewed at the counter. Unnecessary originals and passports will be returned. Incomplete applications must be rejected. Copies of documents that have been sent to the Embassy by post, fax, or email must also be presented at the counter.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
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
                      Navigator.pop(context);
                      /* Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => VisaScreenOne()),
                          (route) => false); */
                    },
                    child: Text(
                      "Visa Overview",
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
                        return VisaScreenSix();
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
      await launch(url, forceWebView: true, enableJavaScript: true);
    }
  }
}
