import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/document_detail/document_screen_four.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class DocumentScreenThree extends StatelessWidget {
  const DocumentScreenThree({Key? key}) : super(key: key);

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
              textTop: "Entrance Exam",
              textBottom: "Documents",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF756300,
              colorValueTwo: 0xFFFFED8A,
            ),
            Center(
              child: Text(
                '3. Entrance Exam (ANP)',
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
                  Text(
                    'Necessary documents for applying Entrance Exam are listed in weblinks below:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
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
                  Text(
                    '1. Educational Certificates',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The required Educational Certificates can be found from the uni-assist website below:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.uni-assist.de/en/how-to-apply/assemble-your-documents/educational-certificates/';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Educational Certificates following uni-assist regulations',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '2. Language Certificates',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'This one can be quite tricky. There are different types of proof of language proficiency. Follow these two links for more details:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.uni-assist.de/en/tools/glossary-of-terms/description/details/proof-of-language-proficiency/';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Proof of Language Proficiency from uni-assist',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.uni-assist.de/en/how-to-apply/assemble-your-documents/language-certificates/';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Language Certificates according to uni-assist',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '3. Certified Copies & Translations',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'There are rules regarding official certification. There are also Standards for Official Certification. Take a look at the following links below and read it carefully:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.uni-assist.de/en/tools/glossary-of-terms/description/details/official-certification/';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Official Certification according to uni-assist',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.uni-assist.de/en/how-to-apply/assemble-your-documents/certified-copies-and-translations/';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Certified Copies & Translations according to uni-assist',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '4. Other documents',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Other important documents you may need can be found on the link below:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final url =
                          'https://www.uni-assist.de/en/how-to-apply/assemble-your-documents/other-documents/';

                      openBrowserURLs(url: url, inApp: true);
                    },
                    child: Text(
                      'Other Documents according to uni-assist',
                      style: redTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '5. Your German Language Certificate (B1 or B2)',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'After finishing the language course, you will face the final examination to earn your German language certificate. This document is required for your visa application.',
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
                        return DocumentScreenFour();
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
