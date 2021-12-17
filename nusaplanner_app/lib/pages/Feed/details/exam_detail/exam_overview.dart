import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/exam_detail/exam_screen_one.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class ExamOverview extends StatelessWidget {
  const ExamOverview({Key? key}) : super(key: key);

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
              image: "assets/images/exam_overview.png",
              textTop: "Preparatory\nClass\n(Studienkolleg)",
              textBottom: "Overview",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF51087E,
              colorValueTwo: 0xFFD7A1F9,
            ),
            Center(
              child: Text(
                'Overview',
                style: blackSemiBoldTextStyle.copyWith(fontSize: spaceThirty),
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
                        text: 'To start your studies in Germany, you need a ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                              text: 'Hochschulzugangs-berechtigung (HZB) ',
                              style:
                                  blackSemiBoldTextStyle.copyWith(fontSize: 16),
                              children: [
                                TextSpan(children: [
                                  TextSpan(
                                    text:
                                        'or university entrance qualification in Germany.',
                                    style: blackLightTextStyle.copyWith(
                                        fontSize: 16),
                                  ),
                                ])
                              ]),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                        text:
                            'Therefore, high school graduation diploma or equivalent* from Indonesia National Education System (*hereinafter are called high school graduates) are not included in the HZB or ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text:
                                'are not equivalent to German high school graduation (Abitur).',
                            style:
                                blackSemiBoldTextStyle.copyWith(fontSize: 16),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                        text:
                            'To receive the equal diploma, high school graduates must pass the German university entrance qualification examination for prospective international students called the ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Feststellungsprüfung.',
                            style:
                                blackSemiBoldTextStyle.copyWith(fontSize: 16),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                        text:
                            'But firstly, you must take the preparatory class called ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                              text: 'Studienkolleg',
                              style:
                                  blackSemiBoldTextStyle.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                  text:
                                      ', where you will study in one class for a particular field according to the major that you will choose at German universities.',
                                  style: blackLightTextStyle.copyWith(
                                      fontSize: 16),
                                )
                              ])
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                        text:
                            'The average study duration at the Studienkolleg is ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'two semesters or one year.',
                            style:
                                blackSemiBoldTextStyle.copyWith(fontSize: 16),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'In order to be accepted at the Studienkolleg, following steps will be discussed:',
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
                    '1. Prepare the documents',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '2. Type of Studienkollegs',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '3. Choosing the course for Studienkolleg',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '4. What is Aufnahmeprüfung?',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
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
                      "Return",
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
                        return ExamScreenOne();
                      }));
                    },
                    child: Text(
                      "Start",
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
}
