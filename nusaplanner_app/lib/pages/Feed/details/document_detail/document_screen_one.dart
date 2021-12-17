import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/document_detail/document_screen_two.dart';
import 'package:nusaplanner_app/utils/pdf_viewer_page.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class DocumentScreenOne extends StatelessWidget {
  const DocumentScreenOne({Key? key}) : super(key: key);

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
              image: "assets/images/departure_one.png",
              textTop: "Language\nCourse",
              textBottom: "Documents",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF756300,
              colorValueTwo: 0xFFFFED8A,
            ),
            Center(
              child: Text(
                '1. Language Course',
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
                            'For language course application, you actually don’t need to bring any documents. However, ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                              text:
                                  'your German Language Certificate (B1 or B2) ',
                              style:
                                  blackSemiBoldTextStyle.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                  text:
                                      'is one of the required documents for visa application.',
                                  style: blackSemiBoldTextStyle.copyWith(
                                      fontSize: 16),
                                )
                              ]),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
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
                    'Other important links regarding language course can be found below:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.goethe.de/ins/id/en/spr/kur/gia.html';

                      openBrowserURLs(url: url, inApp: false);
                    },
                    child: Text(
                      'German Courses in Indonesia',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.coe.int/en/web/common-european-framework-reference-languages/?';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Common European Framework of Reference for Languages (CEFR)',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.goethe.de/ins/id/en/sta/jak/prf/ber.html';

                      openBrowserURLs(url: url, inApp: false);
                    },
                    child: Text(
                      'Dates and Enrollment',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DocumentScreenTwo();
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

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

  Future openBrowserURLs({required String url, bool inApp = false}) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: inApp, enableJavaScript: inApp);
    }
  }
}
