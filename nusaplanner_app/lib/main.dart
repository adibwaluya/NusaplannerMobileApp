import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/Feed/feed_page.dart';
import 'package:nusaplanner_app/pages/login/login_page.dart';
import 'package:nusaplanner_app/pages/signup/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => Auth(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences sharedPreferences;
  final storage = new FlutterSecureStorage();
  String _dateEndString = "";

  void _tryToAuthenticate() async {
    var token = await storage.read(key: 'token');

    Provider.of<Auth>(context, listen: false).attempt(token: token);
  }

  _loadDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _dateEndString = (prefs.getString('endDatePref') ?? "");
    });
  }

  @override
  void initState() {
    _tryToAuthenticate();
    super.initState();

    _loadDate();
    // _authService.showLogIn();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        /* routes: {
        '/': (context) => LoginPage(),
        '/feed-page': (context) => FeedPage(),
        '/sign-up': (context) => SignupPage(),
      }, */
        home: LoginPage());
  }
}
