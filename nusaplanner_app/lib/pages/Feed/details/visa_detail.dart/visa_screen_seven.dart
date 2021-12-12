import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail.dart/visa_screen_eight.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail.dart/visa_screen_one.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class VisaScreenSeven extends StatelessWidget {
  const VisaScreenSeven({Key? key}) : super(key: key);

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
                image: "assets/images/visa_six.png",
                textTop: "Collecting",
                textBottom: "Your Passport",
                offset: 0,
                iconleft: true),
            Center(
              child: Text(
                '6. Germany, here I come!',
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
                    'Now your visa is just granted! You still have to collect your passport back. As soon as your visa application is decided, you can collect your passport.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'When applying for a national visa, you will be notified by email or telephone as soon as the visa can be issued.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Please submit your passport at the following time (table below). The visa will be issued the same day and you can bring your passport with you again.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
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
                              'Passport submission and proof of collection',
                              style:
                                  blackMediumTextStyle.copyWith(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Monday - Friday, 07:30 - 10:00 WIB',
                            style: blackLightTextStyle.copyWith(fontSize: 12),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text('Picking up Visa',
                              style: blackSemiBoldTextStyle.copyWith(
                                  fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Monday - Friday, 11:00 - 12:00 WIB',
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
                    'Basically, you hand over your own passport. If this is not possible, you can hire a representative to do this. To achieve it, please draw up a written power of attorney and present it to your representative.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  )
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
                      Navigator.pop(context);
                      Navigator.pop(context);
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
                        return VisaScreenEight();
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
