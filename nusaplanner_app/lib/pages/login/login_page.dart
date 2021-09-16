import 'package:flutter/material.dart';
import 'package:nusaplanner_app/theme.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BottomNavigation();
        }));
      },
      child: Text(
        'Baca Artikel',
        style: whiteTextStyle.copyWith(fontSize: 12),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
        backgroundColor: MaterialStateProperty.all<Color>(darkPurpleColor),
      ),
    );
  }
}
