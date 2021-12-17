import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/onboarding/date_input/date_input_page.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_five/components/five_background.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

class OnboardingFivePage extends StatefulWidget {
  const OnboardingFivePage({Key? key}) : super(key: key);

  @override
  _OnboardingFivePageState createState() => _OnboardingFivePageState();
}

class _OnboardingFivePageState extends State<OnboardingFivePage> {
  bool _isLoading = false;
  Text value = Text('');
  late var email;

  final storage = FlutterSecureStorage();
  //String? myEmail = await storage.read(key: "email");
  void _updateSplashFive() async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).updateSplashFive(
        data: {'is_splash_five': 1, 'email': await storage.read(key: 'email')},
        success: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DateInputScreen();
          }));
        },
        error: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingFivePage();
          }));
        });
  }

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
                        TextSpan(text: 'currently only contains the '),
                        TextSpan(
                            text: 'sign out button ',
                            style: blackSemiBoldTextStyle),
                        TextSpan(text: 'if you want to log out.'),
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
                        onPressed:
                            _isLoading ? null : () => _updateSplashFive(),
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
