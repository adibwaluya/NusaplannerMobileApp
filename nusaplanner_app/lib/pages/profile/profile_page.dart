import 'package:flutter/material.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/login/login_page.dart';
import 'package:nusaplanner_app/pages/profile/update_date_page.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is Profile page. If you want to sign out.\nIn future development, this page will\ncontain more information. ',
              style: blackRegularTextStyle.copyWith(fontSize: 14),
            ),
            /* GestureDetector(
              onTap: () {
                // (route) => false);
                Provider.of<Auth>(context, listen: false).signOut(success: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("You have been signed out!")));
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false);
                });
              },
              child: Text(
                'Sign Out',
                style: darkPurpleTextStyle.copyWith(fontSize: 12),
              ),
            ), */
            ElevatedButton(
              onPressed: () {
                Provider.of<Auth>(context, listen: false).signOut(success: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("You have been signed out!")));
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false);
                });
              },
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
                backgroundColor:
                    MaterialStateProperty.all<Color>(darkPurpleColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
