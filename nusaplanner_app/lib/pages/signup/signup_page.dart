import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_one/onboarding_one_page.dart';
import 'package:nusaplanner_app/pages/signup/components/signup_background.dart';
import 'package:nusaplanner_app/pages/signup/components/signup_body.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';

import '../../theme.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupBody(),
    );
  }
}
