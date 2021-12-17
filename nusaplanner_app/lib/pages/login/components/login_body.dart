import 'package:flutter/material.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/login/components/login_background.dart';
import 'package:nusaplanner_app/pages/login/login_page.dart';
import 'package:nusaplanner_app/pages/signup/signup_page.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../theme.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //late final bool isSplashOne;
  bool _isLoading = false;
  // String userIdString = "";
  late int userIdInt;

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
        ),
      );

  Future<int?> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userIdInt = (prefs.getInt('addUserId') ?? 0);
    });
  }

  @override
  void initState() {
    super.initState();

    _loadUserId();
    // _testLoadDate();
  }

  Widget build(BuildContext context) {
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
                    controller: _emailController,
                    style: blackRegularTextStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your Email',
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
                    controller: _passwordController,
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
              'Don’t have an account yet? ',
              style: greyTextStyle.copyWith(fontSize: 12),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupPage()));
              },
              child: Text(
                'Sign Up',
                style: darkPurpleTextStyle.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      );
    }

    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();

      super.dispose();
    }

    void _submit() {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Auth>(context, listen: false).signin(
          data: {
            'email': _emailController.text,
            'password': _passwordController.text,
            //'isSplashOne': isSplashOne // TO BE UPDATED
          },
          success: () {
            //isSplashOne = true; // TO BE UPDATED
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BottomNavigation();
            }));
          },
          error: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
            displayDialog(context, "Invalid Email and Password",
                "Please fill in the correct credentials");
          });
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Consumer<Auth>(builder: (context, auth, child) {
            if (auth.loggedIn) {
              return const BottomNavigation();
            } else {
              return LoginBackground(
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 100, left: 65, right: 65),
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
                                style: blackSemiBoldTextStyle.copyWith(
                                    fontSize: 30),
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
                                    onPressed:
                                        _isLoading ? null : () => _submit(),
                                    child: Text(
                                      _isLoading ? "Logging in..." : "Sign in",
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              whiteColor),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              darkPurpleColor),
                                    )),
                              ),
                              createAccount(),
                            ],
                          ),
                        ),
                      ]),
              );
            }
          }),
        ),
      ),
    );
  }
}
