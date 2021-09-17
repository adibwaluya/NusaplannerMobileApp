import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/login/components/login_background.dart';
import 'package:nusaplanner_app/pages/login/components/login_body.dart';
import 'package:nusaplanner_app/theme.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}
