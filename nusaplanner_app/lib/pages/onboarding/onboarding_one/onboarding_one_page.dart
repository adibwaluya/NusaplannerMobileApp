import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/Feed/feed_page.dart';
import 'package:nusaplanner_app/pages/login/components/login_background.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_one/components/one_background.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_two/onboarding_two_page.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

class OnboardingOnePage extends StatefulWidget {
  const OnboardingOnePage({Key? key}) : super(key: key);

  @override
  _OnboardingOnePageState createState() => _OnboardingOnePageState();
}

class _OnboardingOnePageState extends State<OnboardingOnePage> {
  bool _isLoading = false;
  Text value = Text('');
  late var email;
  final storage = FlutterSecureStorage();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
        ),
      );

  /* void _updateSplashOne() async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).updateSplashOne(
        data: {'is_splash_one': 1, 'email': await storage.read(key: 'email')},
        success: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingTwoPage();
          }));
        },
        error: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingOnePage();
          }));
        });
  } */

  void _createTodoList() async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).showTodoList(
        data: {
          'planning_language_one': 0,
          'planning_language_two': 0,
          'planning_language_three': 0,
          'planning_document_one': 0,
          'planning_document_two': 0,
          'planning_document_three': 0,
          'planning_bankAccount_one': 0,
          'planning_visa_one': 0,
          'planning_visa_two': 0,
          'planning_anp_one': 0,
          'planning_anp_two': 0,
          'planning_departure_one': 0,
          'planning_departure_two': 0,
          'user_id': await storage.read(key: 'id')
        },
        success: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingTwoPage();
          }));
        },
        error: () {
          // displayDialog(context, 'Error Occured', 'Check your codes!');
          // print(await storage.read(key: 'id'));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error. Cannot continue.")));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingOnePage();
          }));
        });
  }

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
                      onPressed: _isLoading ? null : () => _createTodoList(),
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
