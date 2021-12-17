import 'package:flutter/material.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class DepartureScreenSix extends StatelessWidget {
  const DepartureScreenSix({Key? key}) : super(key: key);

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
              image: "assets/images/departure_six.png",
              textTop: "Choosing",
              textBottom: "Departure Time",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xff4361EE,
              colorValueTwo: 0xffCAE6FF,
            ),
            Center(
              child: Text(
                '6. When is the best time?',
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
                    'Qatar Airways, Emirates, and Etihad usually offer 2 departure time per day, namely morning/afternoon and afternoon/dawn.',
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
                    '1. Morning/afternoon flight hours',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'When you depart in the morning or afternoon, you will arrive on the evening at around 10 pm. Most of the times, the airline with this departure time has cheaper ticket price.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'However, this flight is not recommended for applicants who fly to Germany for the very first time.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '2. Afternoon/dawn flight hours',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'You will arrive in Germany in the afternoon or evening. Therefore, it is advised to find the ticket with this type of departure time.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                        text:
                            'To avoid long queues during the check-in, do not forget to register yourself through the ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                              text:
                                  'web check-in (the earliest 24 hours before departure) ',
                              style:
                                  blackSemiBoldTextStyle.copyWith(fontSize: 16),
                              children: [
                                TextSpan(
                                    text: 'and ',
                                    style: blackLightTextStyle.copyWith(
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: 'print your boarding pass.',
                                        style: blackSemiBoldTextStyle.copyWith(
                                            fontSize: 16),
                                      )
                                    ]),
                              ]),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'During the web check-in, you can reserve your seat beforehand and as you arrive at the airport, you just need to put your luggages at the Baggage drop counter without needing to queue to check-in',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
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
