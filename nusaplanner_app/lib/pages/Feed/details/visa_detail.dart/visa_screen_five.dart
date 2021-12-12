import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail.dart/visa_screen_six.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class VisaScreenFive extends StatelessWidget {
  const VisaScreenFive({Key? key}) : super(key: key);

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
                image: "assets/images/visa_five.png",
                textTop: "Visa Application",
                textBottom: "Process",
                offset: 0,
                iconleft: true),
            Center(
              child: Text(
                '4. Process...',
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
                    'So, you have all of previously mentioned documents, the primary documents on the first section, and copies of each of them? Nice! It is time to visit the embassy.',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Now, we will walk you through the core process of the study preparation. These are the important steps you need to schedule:',
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
                    'a. Make an appointment ASAP!',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'b. Complete all of the necessary documents',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'c. What to do on the appointment day...',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'd. The fee... the money...',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'e. Documents examination',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
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
                        return VisaScreenSix();
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
