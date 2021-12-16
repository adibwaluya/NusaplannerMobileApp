import 'package:flutter/material.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class ExamScreenFour extends StatelessWidget {
  const ExamScreenFour({Key? key}) : super(key: key);

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
              image: "assets/images/departure_four.png",
              textTop: "Aufnahme-\nprüfung",
              textBottom: "(ANP)",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF3383CD,
              colorValueTwo: 0xFF11249F,
            ),
            Center(
              child: Text(
                '4. What is Aufnahmeprüfung?',
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
                            'Aufnahmeprüfung is the Studienkolleg entrance exam. After you’ve done all the application progress, you are now waiting for the ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                              text:
                                  'invitation letter to take the Studienkolleg entrance exam ',
                              style:
                                  blackSemiBoldTextStyle.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                    text: 'or also known as ',
                                    style: blackLightTextStyle.copyWith(
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: 'Einladung zur Aufnahmeprüfung',
                                        style: blackSemiBoldTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ]),
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
                  Text.rich(
                    TextSpan(
                        text:
                            'After receiving this invitation letter, you have to bring this letter to the German Embassy as ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'one of the required documents for applying the visa.',
                            style:
                                blackSemiBoldTextStyle.copyWith(fontSize: 16),
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
}
