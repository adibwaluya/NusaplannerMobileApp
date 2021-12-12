import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail/visa_screen_five.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class VisaScreenFour extends StatelessWidget {
  const VisaScreenFour({Key? key}) : super(key: key);

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
              image: "assets/images/visa_four.png",
              textTop: "Documents for",
              textBottom: "Student\nApplicant Visa",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF3383CD,
              colorValueTwo: 0xFF11249F,
            ),
            Center(
              child: Text(
                '3. Student Applicant Visa',
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
                    'In this section, the students and the study applicants will be distinguished. This might sound a bit confusing, but worry not!',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We are going to specify the documents for applicants who currently are students and the study applicants.',
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
                    'a. Documents for applicants who are students',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Below are the required documents for the applicants with the status "Student":',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Table(
                    border: TableBorder.all(color: blackColor),
                    children: [
                      TableRow(children: [
                        Text(''),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                              'Letter of Admission (Zulassungsbescheid) of a College or Studienkolleg',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '2 Copies',
                            style: blackLightTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('OR',
                              style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                              'Reservation of an Academy Place (Studienplatzvormerkung)',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2 Copies',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('OR',
                              style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text('Conditional Approval letter',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2 Copies',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('OR',
                              style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                              'Confirmation Letter from the College or Studienkolleg',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2 Copies',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('OR',
                              style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                              'Application Confirmation from the Institution (Bewerbebestätigung)',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2 Copies',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('OR',
                              style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                              'The positive Final Communication (Endgultige Mitteilung) from UniAssist',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2 Copies',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'b. Study Applicants',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'The study applicants who do not posses the required documents above:',
                    style: blackLightTextStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Table(
                    border: TableBorder.all(color: blackColor),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                              'Diploma / STTB (high school graduation certificate), legalized photocopy from school',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('1 legalized copy',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '1 copy',
                            style: blackLightTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                              'SKHUN / NEM (certificate from high school graduation exam), legalized photocopy from school',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2 copies',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '3rd grade high school report card, legalized photocopy from school',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text('1 legalized copy',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('1 copy',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Self-written motivation letter by the applicant, which contains study plan (reason of choosing certain major). Best written in German.',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text('Original copy',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('1 copy',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Proof of Correspondence with College / Studienkolleg or UniAssist',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text('',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2 copies',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'c. German Language Certificate',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'For study applicants who cannot show confirmation of acceptance from a college or Studienkolleg, German Language Proficiency is very important as one of the evidences to show the seriousness of studying in Germany.',
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
                          child: Text(
                              'German Language Proficiency Certificate B1',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Original + 1 copy',
                            style: blackLightTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                              'If you have not possessed a B1 certificate yet, you must bring the form of Registration for an Advances Language Course in Germany',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('2 copies',
                              style:
                                  blackLightTextStyle.copyWith(fontSize: 12)),
                        ),
                      ]),
                    ],
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
                        return VisaScreenFive();
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
}
