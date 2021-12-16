import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/exam_detail/exam_screen_two.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme.dart';

class ExamScreenOne extends StatelessWidget {
  const ExamScreenOne({Key? key}) : super(key: key);

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
              textTop: "Necessary",
              textBottom: "Documents",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF116530,
              colorValueTwo: 0xFFA3EBB1,
            ),
            Center(
              child: Text(
                '1. Prepare the Documents!',
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
                    'Before applying, you have to prepare the necessary documents. Nowadays, assembling the documents can be done by following the instructions from uni-assist.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'What is uni-assist?',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'uni-assist is a non-profit organisation that’s responsible for the evaluation of international school and university certificates and determining their equivalence to German educational standards.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'uni-assist offers a central point of contact for applying to a great number of universities.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Therefore, most of your application process is done through uni-assist. There are 4 types of important document you need to assembly:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
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
                        return ExamScreenTwo();
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
