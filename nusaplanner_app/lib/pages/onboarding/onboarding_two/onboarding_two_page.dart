import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_three/onboarding_three_page.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_two/components/two_background.dart';

import '../../../theme.dart';

class OnboardingTwoPage extends StatefulWidget {
  const OnboardingTwoPage({Key? key}) : super(key: key);

  @override
  _OnboardingTwoPageState createState() => _OnboardingTwoPageState();
}

class _OnboardingTwoPageState extends State<OnboardingTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingTwoBackground(
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
                      'assets/images/onboard_feed.png',
                      width: 200,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'What should I do now?',
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
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: blackRegularTextStyle.copyWith(
                              height: 2, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(text: 'On the '),
                            TextSpan(
                                text: 'Feed Page',
                                style: blackSemiBoldTextStyle),
                            TextSpan(text: ', you can see your personal '),
                            TextSpan(
                                text: 'Dashboard. ',
                                style: blackSemiBoldTextStyle),
                            TextSpan(
                                text:
                                    'Information that’s required for your study necessities such as accomodation, required documents and so on, can be found in this page.'),
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
                            return OnboardingThreePage();
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
            )
          ],
        ),
      ),
    );
  }
}
