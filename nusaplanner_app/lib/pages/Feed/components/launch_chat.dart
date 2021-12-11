import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

import '../../../theme.dart';
import '../feed_page.dart';

class LaunchChat extends StatefulWidget {
  const LaunchChat({Key? key}) : super(key: key);

  @override
  _LaunchChatState createState() => _LaunchChatState();
}

class _LaunchChatState extends State<LaunchChat> {
  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;

    Future _launcChat() async {
      await new Future.delayed(const Duration(seconds: 3), () {});
      return Consumer<Auth>(
        builder: (context, auth, child) {
          if (auth.loggedIn) {
            dynamic user = {
              'userId':
                  '${auth.user.id}', //Replace it with the userId of the logged in user
            };
            dynamic conversationObject = {
              'appId':
                  '34ff17301367d14868f0dff1390c0b832', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from Kommunicate dashboard.
              'kmUser': jsonEncode(user)
            };

            KommunicateFlutterPlugin.buildConversation(conversationObject)
                .then((clientConversationId) {
              print("Conversation builder success : " +
                  clientConversationId.toString());
            }).catchError((error) {
              print("Conversation builder error : " + error.toString());
            });
          }
          return Text('Almost there...');
        },
      );
    }

    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: _launcChat(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return Consumer<Auth>(
              builder: (context, auth, child) {
                setState(() {
                  _isLoading = true;
                });
                if (auth.loggedIn) {
                  dynamic user = {
                    'userId':
                        '${auth.user.id}', //Replace it with the userId of the logged in user
                  };
                  dynamic conversationObject = {
                    'appId':
                        '34ff17301367d14868f0dff1390c0b832', // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from Kommunicate dashboard.
                    'kmUser': jsonEncode(user)
                  };

                  KommunicateFlutterPlugin.buildConversation(conversationObject)
                      .then((clientConversationId) {
                    print("Conversation builder success : " +
                        clientConversationId.toString());
                  }).catchError((error) {
                    print("Conversation builder error : " + error.toString());
                  });
                }
                return ShowKommunicate();
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      )),
    );
  }
}

class ShowKommunicate extends StatelessWidget {
  const ShowKommunicate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Finish your consultation?',
            style: blackRegularTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return BottomNavigation();
              }),
            ),
            child: Text('Return to Feed Page',
                style: whiteTextStyle.copyWith(fontSize: 16)),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
              backgroundColor:
                  MaterialStateProperty.all<Color>(darkPurpleColor),
            ),
          ),
        ],
      ),
    );
  }
}
