import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/Feed/components/feed_body.dart';
import 'package:nusaplanner_app/pages/Feed/feed_page.dart';
import 'package:nusaplanner_app/theme.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';
import 'package:nusaplanner_app/widgets/date_picker_widget.dart';
import 'package:provider/provider.dart';

class UpdateDatePage extends StatefulWidget {
  const UpdateDatePage({Key? key}) : super(key: key);

  @override
  _UpdateDatePageState createState() => _UpdateDatePageState();
}

class _UpdateDatePageState extends State<UpdateDatePage> {
  bool _isLoading = false;
  final storage = FlutterSecureStorage();

  void _updateDatePrep() async {
    setState(() {
      _isLoading = true;
    });

    Provider.of<Auth>(context, listen: false).updateDate(
        data: {
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return UpdateDatePage();
          }));
        });
  }

  void _backToFeedPage() {
    setState(() {
      _isLoading = true;
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return BottomNavigation();
    }), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    //setting the seconds to 2, you can set as per your
    // convenience
    Future.delayed(Duration(seconds: 2), () {
      CircularProgressIndicator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 25),
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
                            style: blackRegularTextStyle.copyWith(
                                height: 2, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(text: 'Please add the '),
                              TextSpan(
                                  text: 'Start Date ',
                                  style: blackSemiBoldTextStyle),
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
                            style: blackRegularTextStyle.copyWith(
                                height: 2, fontSize: 14),
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
                            onPressed:
                                _isLoading ? null : () => _updateDatePrep(),
                            child: Text('Start Your Journey!',
                                style: whiteTextStyle.copyWith(fontSize: 16)),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(whiteColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  darkPurpleColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                            onPressed:
                                _isLoading ? null : () => _backToFeedPage(),
                            child: Text('Return to Feed Page',
                                style: blackMediumTextStyle.copyWith(
                                    fontSize: 16)),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(whiteColor),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(redColor),
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
