import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_four/onboarding_four_page.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_three/components/three_background.dart';

import '../../../theme.dart';

class OnboardingThreePage extends StatefulWidget {
  const OnboardingThreePage({Key? key}) : super(key: key);

  @override
  _OnboardingThreePageState createState() => _OnboardingThreePageState();
}

class _OnboardingThreePageState extends State<OnboardingThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingThreeBackground(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  'assets/images/Nusatutor_logo_blue.png',
                  width: 70,
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/onboard_plan.png',
                    width: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: RichText(
                      text: TextSpan(
                    style: blackRegularTextStyle.copyWith(height: 2),
                    children: <TextSpan>[
                      TextSpan(text: 'On the '),
                      TextSpan(
                          text: 'Plan Page', style: blackSemiBoldTextStyle),
                      TextSpan(
                          text:
                              ', you can see the sequence of your study preparations in form of '),
                      TextSpan(
                          text: 'Todo-Lists. ', style: blackSemiBoldTextStyle),
                      TextSpan(
                          text:
                              'Subsequently, you can check the box after you completed a task.'),
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
                          return OnboardingFourPage();
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
      )),
    );
  }
}
