import 'package:flutter/material.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class VisaScreenEight extends StatelessWidget {
  const VisaScreenEight({Key? key}) : super(key: key);

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
              image: "assets/images/visa_seven.png",
              textTop: "Visa",
              textBottom: "Rejection",
              offset: 0,
              iconleft: true),
          Center(
            child: Text(
              '7. Rejected...',
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
                  'If you are of the opinion that the decision of the Embassy was incorrect, please explain in writing, why you have this opinion and request for the re-checking of the rejection of your visa application.',
                  style: blackLightTextStyle.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Two different scenarios may happen: ',
                  style: blackSemiBoldTextStyle.copyWith(fontSize: 16),
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
                  'a. 1st Alternative',
                  style: blackRegularTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'b. 2nd Alternative',
                  style: blackRegularTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'c. Biometric Passport Photo',
                  style: blackRegularTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'd. Health Insurance Policy',
                  style: blackRegularTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'e. Additional Documents (under 18)',
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
                    Navigator.pop(context);
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
    ));
  }
}
