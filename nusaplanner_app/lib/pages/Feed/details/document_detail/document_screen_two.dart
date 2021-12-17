import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/document_detail/document_screen_three.dart';
import 'package:nusaplanner_app/utils/pdf_api.dart';
import 'package:nusaplanner_app/utils/pdf_viewer_page.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class DocumentScreenTwo extends StatelessWidget {
  const DocumentScreenTwo({Key? key}) : super(key: key);

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
              image: "assets/images/document_two.png",
              textTop: "Visa and\nBank",
              textBottom: "Documents",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF756300,
              colorValueTwo: 0xFFFFED8A,
            ),
            Center(
              child: Text(
                '2. Visa and Bank Account',
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
                        text: 'This section is very important. Therefore, ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'it is highly suggested that you firstly read Visa Section thoroughly!',
                            style:
                                blackSemiBoldTextStyle.copyWith(fontSize: 16),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The important documents for visa can be seen below:',
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
                    '1. Long-Term Form (2 Copies)',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://videx-national.diplo.de/videx/visum-erfassung/#/videx-langfristiger-aufenthalt';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Long-Term Stay Form',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '2. Consent of Contact form',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final path =
                          'assets/documents/einverstaendniserklaerung.pdf';
                      final file = await PDFApi.loadAsset(path);
                      openPDF(context, file);
                    },
                    child: Text(
                      'consentofcontact.pdf',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '3. Itinerary Form (2 Copies)',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final path = 'assets/documents/reiseverlauf.pdf';
                      final file = await PDFApi.loadAsset(path);
                      openPDF(context, file);
                    },
                    child: Text(
                      'itinerary.pdf',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '4. Biometric Passport Photo (3 Photos)',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '5. Passport (original and 2 copies)',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '6. Health Insurance Policy',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final path = 'assets/documents/krankenversicherung.pdf';
                      final file = await PDFApi.loadAsset(path);
                      openPDF(context, file);
                    },
                    child: Text(
                      'healthinsurance.pdf',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '7. Additional Documents (under 18)',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Check Visa section for more information regarding Additional Documents and Bank Account Documents.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '8. Table-form Curriculum Vitae / CV (2 Copies)',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '9. Receipt Confirmation / Geldeingabebestätigung (Original and 1 Copy)',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '10. Important links regarding frozen account',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final path = 'assets/documents/sperrkonto.pdf';
                      final file = await PDFApi.loadAsset(path);
                      openPDF(context, file);
                    },
                    child: Text(
                      'frozenaccount.pdf',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '11. Documents for Student Applicant Visa',
                    style: blackMediumTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    'This part consists of crucial documents. It is suggested that you visit the Visa section directly.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'Do not forget to ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                              text: 'translate all of the documents. ',
                              style:
                                  blackSemiBoldTextStyle.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                  text:
                                      'List of sworn translators can be found below:',
                                  style: blackLightTextStyle.copyWith(
                                      fontSize: 16),
                                ),
                              ]),
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final path = 'assets/documents/uebersetzerliste.pdf';
                      final file = await PDFApi.loadAsset(path);
                      openPDF(context, file);
                    },
                    child: Text(
                      'sworntranslators.pdf',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
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
                      "List Overview",
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
                        return DocumentScreenThree();
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
