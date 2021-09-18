import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/feed_page.dart';
import 'package:nusaplanner_app/pages/login/login_page.dart';
import 'package:nusaplanner_app/pages/signup/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        '/feed-page': (context) => FeedPage(),
        '/sign-up': (context) => SignupPage(),
      },
    );
  }
}
