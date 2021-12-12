import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail.dart/visa_screen_four.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail.dart/visa_screen_one.dart';
import 'package:nusaplanner_app/utils/pdf_api.dart';
import 'package:nusaplanner_app/utils/pdf_viewer_page.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class VisaScreenThree extends StatelessWidget {
  const VisaScreenThree({Key? key}) : super(key: key);

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
                image: "assets/images/visa_three.png",
                textTop: "Preparing Additional",
                textBottom: "Documents",
                offset: 0,
                iconleft: true),
            Center(
              child: Text(
                '2. Bank account',
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
                    'You need to set up the blocked account (Sperrkontos) so that your living expenses in Germany can be covered.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'You need to prepare the necessary documents for this:',
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
                    'a. Curriculum Vitae (CV)',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '2 copies of table-form Curriculum Vitae are necessary.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'b. Receipt Confirmation (Geldeingabebestätigung)',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You need the original confirmation of receipt of payment and 1 copy of it.',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'c. Others',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'For more information regarding the frozen account (sperrkonto):',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
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
                        return VisaScreenFour();
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
}
