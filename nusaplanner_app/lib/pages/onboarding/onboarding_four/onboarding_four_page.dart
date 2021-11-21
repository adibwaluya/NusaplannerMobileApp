import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_five/onboarding_five_page.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_four/components/four_background.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_three/onboarding_three_page.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

class OnboardingFourPage extends StatefulWidget {
  const OnboardingFourPage({Key? key}) : super(key: key);

  @override
  _OnboardingFourPageState createState() => _OnboardingFourPageState();
}

class _OnboardingFourPageState extends State<OnboardingFourPage> {
  bool _isLoading = false;
  Text value = Text('');
  late var email;

  final storage = FlutterSecureStorage();
  //String? myEmail = await storage.read(key: "email");
  void _updateSplashFour() async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).updateSplashFour(
        data: {'is_splash_four': 1, 'email': await storage.read(key: 'email')},
        success: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingFivePage();
          }));
        },
        error: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingFourPage();
          }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OnboardingFourBackground(
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
                  'assets/images/onboarding_chat.png',
                  width: 200,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'When in doubt, ask!',
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
                  style:
                      blackRegularTextStyle.copyWith(height: 2, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Any difficulties and confusion can be consulted through our '),
                    TextSpan(text: 'Live Chat ', style: blackSemiBoldTextStyle),
                    TextSpan(text: 'Services, which can be found on the '),
                    TextSpan(
                        text: 'Consult Page. ', style: blackSemiBoldTextStyle),
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
                    onPressed: _isLoading ? null : () => _updateSplashFour(),
                    child: Text('Next',
                        style: whiteTextStyle.copyWith(fontSize: 16)),
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
                ),
              ),
            ],
          ),
        )
      ],
    )));
  }
}
