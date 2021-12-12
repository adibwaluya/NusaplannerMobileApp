import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/classes/user_sp.dart';
import 'package:nusaplanner_app/pages/Feed/details/visa_detail/visa_screen_one.dart';
import 'package:nusaplanner_app/pages/Feed/feed_page.dart';
import 'package:nusaplanner_app/pages/login/login_page.dart';
import 'package:nusaplanner_app/pages/signup/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
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
  // String userIdString = "";

  void _tryToAuthenticate() async {
    var token = await storage.read(key: 'token');

    Provider.of<Auth>(context, listen: false).attempt(token: token);
  }

  void _tryToShowTodoList() async {
    var token = await storage.read(key: 'token');

    Provider.of<Auth>(context, listen: false).attemptTodoList(token: token);
  }

  /* _loadDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _dateEndString = (prefs.getString('endDatePref') ?? "");
    });
  }

  Future<int?> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.getInt('addUserId') ?? 0;
    });
  } */

  @override
  void initState() {
    _tryToAuthenticate();
    _tryToShowTodoList();
    /* Auth.lanOne.toString();
    Auth.lanTwo.toString();
    Auth.lanThree.toString(); */
    super.initState();

    // _loadDate();
    // _loadUserId();
    // _authService.showLogIn();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/sign-up': (context) => SignupPage(),
          '/visa-overview': (context) => VisaScreenOne(),
        },
        home: LoginPage());
  }
}
