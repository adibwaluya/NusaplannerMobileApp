import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/onboarding/date_input/date_input_page.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_five/components/five_background.dart';

import '../../../theme.dart';

class OnboardingFivePage extends StatefulWidget {
  const OnboardingFivePage({Key? key}) : super(key: key);

  @override
  _OnboardingFivePageState createState() => _OnboardingFivePageState();
}

class _OnboardingFivePageState extends State<OnboardingFivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingFiveBackground(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Image.asset(
                      'assets/images/Nusatutor_logo_blue.png',
                      width: 70,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/onboarding_profile.png',
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'Your Profile and Settings',
                      style: blackSemiBoldTextStyle.copyWith(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: RichText(
                        text: TextSpan(
                      style: blackRegularTextStyle.copyWith(
                          height: 2, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(text: 'On the '),
                        TextSpan(
                            text: 'Profile Page, ',
                            style: blackSemiBoldTextStyle),
                        TextSpan(
                            text:
                                'you can see your own Profile. You can also change your '),
                        TextSpan(
                            text: 'start and end date ',
                            style: blackSemiBoldTextStyle),
                        TextSpan(text: 'of your study preparation.'),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DateInputScreen();
                          }));
                        },
                        child: Text('Next',
                            style: whiteTextStyle.copyWith(fontSize: 16)),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
