import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/feed_page.dart';
import 'package:nusaplanner_app/pages/login/components/login_background.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_one/components/one_background.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_two/onboarding_two_page.dart';

import '../../../theme.dart';

class OnboardingOnePage extends StatefulWidget {
  const OnboardingOnePage({Key? key}) : super(key: key);

  @override
  _OnboardingOnePageState createState() => _OnboardingOnePageState();
}

class _OnboardingOnePageState extends State<OnboardingOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingOneBackground(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    'assets/images/Nusatutor_logo_blue.png',
                    width: 70,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Plan Your Study With\nOnly One App',
                    style: blackSemiBoldTextStyle.copyWith(fontSize: 30),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Studying abroad can be quite hectic.\nNusaplanner Planning app will help you\nprioritizing the things you need to do.',
                    style:
                        blackLightTextStyle.copyWith(fontSize: 16, height: 2),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return OnboardingTwoPage();
                        }));
                      },
                      child: Text('Explore Now',
                          style: whiteTextStyle.copyWith(fontSize: 16)),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(whiteColor),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(darkPurpleColor),
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
