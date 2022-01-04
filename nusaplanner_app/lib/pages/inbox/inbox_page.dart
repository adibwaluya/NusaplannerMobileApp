import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  bool _isLoading = false;
  void _launchConversation() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Need any help?',
                  style: blackSemiBoldTextStyle.copyWith(fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Center(
                    child: Text(
                      'Having difficulties on\npreparing your study?\nTalk to our consultant for details!',
                      style:
                          blackLightTextStyle.copyWith(fontSize: 16, height: 2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 180,
                  child: Consumer<Auth>(
                    builder: (context, auth, child) {
                      if (auth.loggedIn) {
                        return ElevatedButton(
                          onPressed: _isLoading
                              ? null
                              : () async {
                                  /* Launch Kommunicate chat */
                                  dynamic user = {
                                    'userId':
                                        '${auth.user.id}', //Replace it with the userId of the logged in user
                                  };
                                  dynamic conversationObject = {
                                    'appId':
                                        '34ff17301367d14868f0dff1390c0b832', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from Kommunicate dashboard.
                                    'kmUser': jsonEncode(user)
                                  };

                                  KommunicateFlutterPlugin.buildConversation(
                                          conversationObject)
                                      .then((clientConversationId) {
                                    print("Conversation builder success : " +
                                        clientConversationId.toString());
                                  }).catchError((error) {
                                    print("Conversation builder error : " +
                                        error.toString());
                                  });
                                },
                          child: Text('Consult Now',
                              style: whiteTextStyle.copyWith(fontSize: 16)),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(whiteColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                darkPurpleColor),
                          ),
                        );
                      }
                      return Text('No data');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
