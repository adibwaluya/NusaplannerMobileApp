import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail.dart/visa_screen_three.dart';
import 'package:nusaplanner_app/utils/pdf_api.dart';
import 'package:nusaplanner_app/utils/pdf_viewer_page.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class VisaScreenTwo extends StatefulWidget {
  const VisaScreenTwo({Key? key}) : super(key: key);

  @override
  State<VisaScreenTwo> createState() => _VisaScreenTwoState();
}

class _VisaScreenTwoState extends State<VisaScreenTwo> {
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
                image: "assets/images/visa_two.png",
                textTop: "Visa Application",
                textBottom: "File Preparation",
                offset: 0,
                iconleft: true),
            Center(
              child: Text(
                '1. Application Preparation',
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
                    'Firstly, you need to prepare for the required steps and documents below to fulfill the Visa Application Preparation. These are the main documents you need.',
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
                    'a. Visa Application Form',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Firstly, you need to have 2 copies of Long-term Form:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
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
                    height: 5,
                  ),
                  Text(
                    'Afterwards, fill in the Consent of Contact form below:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
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
                    height: 20,
                  ),
                  Text(
                    'b. Itinerary Form',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Now, you need two copies of the Itinerary Form below:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
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
                    height: 20,
                  ),
                  Text(
                    'c. Biometric Passport Photo',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Regarding your passport photo, you may look photo samples below:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final path = 'assets/documents/fotomuster.pdf';
                      final file = await PDFApi.loadAsset(path);
                      openPDF(context, file);
                    },
                    child: Text(
                      'photosamples.pdf',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'The accepted passport photo is the COLOR biometric photo with white or light gray background, size 3.5 x 4.5 cm',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Remember! The face height must occupy 70-80% of the photo.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You need 3 biometric photos. One photo on each application form, pasted on the last page.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'd. Passport',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You need the original and 2 copies of it.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'IMPORTANT! The passport should not be older than 10 years old, you have at least 3 pages left for the visa and valid for at least 1 year.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'The copies are only consisting of pages with personal data and official records (name, address, etc.).',
                    style: blackMediumTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'e. Health Insurance Policy',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Further information regarding the health insurance policy:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
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
                  SizedBox(height: 20),
                  Text(
                    'f. Additional Documents (under 18)',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Birth certificate, Certificate of Permission of the parents/guardian who are not traveling with you are some of the necessary documents.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You need the original document and 2 copies of it.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You also are going to need to translate all of the documents in Germany. Below is the list of the sworn translators:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return VisaScreenThree();
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
      await launch(url, forceWebView: true, enableJavaScript: true);
    }
  }
}
