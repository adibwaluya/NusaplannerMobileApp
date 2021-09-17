import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/login/components/login_background.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';

import '../../../theme.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  Widget emailInput() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Row(children: [
                Image.asset(
                  "assets/icons/Email_icon.png",
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: TextFormField(
                  style: blackRegularTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email Kamu',
                    hintStyle: hintTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                )),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Row(children: [
                Image.asset(
                  "assets/icons/Lock_icon.png",
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: TextFormField(
                  style: blackRegularTextStyle,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: hintTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                )),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  /* TODO: TO BE FIXED ASAP!*/
  /*
  Widget signInButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 25,
      ),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return BottomNavigation();
              }),
            );
          },
          child: Text(
            'Sign In',
            style: whiteTextStyle.copyWith(fontSize: 16),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
            backgroundColor: MaterialStateProperty.all<Color>(darkPurpleColor),
          )),
    );
  }
  */

  Widget createAccount() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Belum mempunyai Akun? ',
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
          Text(
            'Sign Up',
            style: darkPurpleTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoginBackground(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 65, right: 65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/Nusatutor_logo_transparant.png',
                width: 140,
                height: 122.28,
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                'Nusaplanner',
                style: blackSemiBoldTextStyle.copyWith(fontSize: 30),
              ),
              emailInput(),
              passwordInput(),
              /* TODO: TO BE MOVED ASAP! */
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 25,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return BottomNavigation();
                        }),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(whiteColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(darkPurpleColor),
                    )),
              ),
              createAccount(),
            ],
          ),
        ),
      ]),
    );
  }
}
