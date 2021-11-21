import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_four/onboarding_four_page.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_three/components/three_background.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

class OnboardingThreePage extends StatefulWidget {
  const OnboardingThreePage({Key? key}) : super(key: key);

  @override
  _OnboardingThreePageState createState() => _OnboardingThreePageState();
}

class _OnboardingThreePageState extends State<OnboardingThreePage> {
  bool _isLoading = false;
  Text value = Text('');
  late var email;

  final storage = FlutterSecureStorage();
  void _updateSplashThree() async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).updateSplashThree(
        data: {'is_splash_three': 1, 'email': await storage.read(key: 'email')},
        success: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingFourPage();
          }));
        },
        error: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingThreePage();
          }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingThreeBackground(
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
                    'assets/images/onboard_plan.png',
                    width: 200,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    'Establishing priorities is important',
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
                      onPressed: _isLoading ? null : () => _updateSplashThree(),
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
