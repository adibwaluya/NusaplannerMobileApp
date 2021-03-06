import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';
import 'package:nusaplanner_app/widgets/date_picker_widget.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';

class DateInputScreen extends StatefulWidget {
  const DateInputScreen({Key? key}) : super(key: key);

  @override
  _DateInputScreenState createState() => _DateInputScreenState();
}

class _DateInputScreenState extends State<DateInputScreen> {
  bool _isLoading = false;
  final storage = FlutterSecureStorage();

  void _updateSplashSix() async {
    setState(() {
      _isLoading = true;
    });

    Provider.of<Auth>(context, listen: false).updateSplashSix(
        data: {
          'is_splash_six': 1,
          'date_start': await storage.read(key: 'dateStart'),
          'date_end': await storage.read(key: 'dateEnd'),
          'email': await storage.read(key: 'email'),
        },
        success: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return BottomNavigation();
          }), (route) => false);
        },
        error: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Invalid input date. Please fill in the correct date!")));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DateInputScreen();
          }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(48),
        child: ListView(
          children: [
            Text(
              'Before you start...',
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 25,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style:
                      blackRegularTextStyle.copyWith(height: 2, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(text: 'Please add the '),
                    TextSpan(
                        text: 'Start Date ', style: blackSemiBoldTextStyle),
                    TextSpan(text: 'of your study preparation by '),
                    TextSpan(
                        text: 'clicking the button below, ',
                        style: blackSemiBoldTextStyle),
                    TextSpan(
                        text:
                            ' so that we can estimate the end of your journey.'),
                  ],
                )),
            DatePickerWidget(),
            SizedBox(
              height: 10,
            ),
            RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style:
                      blackRegularTextStyle.copyWith(height: 2, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Estimation of the End Date is calculated by adding the start date with 190 days, which is the standard duration of study preparation to Germany.'),
                  ],
                )),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () => _updateSplashSix(),
                  child: Text('Start Your Journey!',
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
      )),
    );
  }
}
