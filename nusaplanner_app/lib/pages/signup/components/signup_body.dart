import 'package:flutter/material.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/login/login_page.dart';
import 'package:nusaplanner_app/pages/onboarding/onboarding_one/onboarding_one_page.dart';
import 'package:nusaplanner_app/pages/signup/components/signup_background.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';
import '../signup_page.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({Key? key}) : super(key: key);

  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  int isSplashOne = 0;
  int isSplashTwo = 0;
  final dateStart = "dd/mm/YYYY";
  final dateEnd = "dd/mm/YYYY";
  bool _isLoading = false;

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
        ),
      );

  Widget nameInput() {
    return Container(
      margin: EdgeInsets.only(top: 10),
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
                  "assets/icons/Avatar_icon.png",
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: TextFormField(
                  controller: _nameController,
                  style: blackRegularTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Your Full Name',
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

  Widget emailInput() {
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

  Widget passwordConfirmationInput() {
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
                  controller: _passwordConfirmationController,
                  style: blackRegularTextStyle,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password Confirmation',
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
            'Already a member? ',
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Text(
              'Sign In',
              style: darkPurpleTextStyle.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _submit() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).signUp(
        data: {
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
          'password_confirmation': _passwordConfirmationController.text,
          'is_splash_one': 0,
          'is_splash_two': 0,
          'is_splash_three': 0,
          'is_splash_four': 0,
          'is_splash_five': 0,
          'is_splash_six': 0,
          'date_start': dateStart,
          'date_end': dateEnd
        },
        success: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OnboardingOnePage();
          }));
        },
        error: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SignupPage();
          }));
          if (_nameController.text.length < 4) {
            displayDialog(context, 'Invalid Username',
                'The Username should be at least 4 characters');
          } else if (_emailController.text.isEmpty) {
            displayDialog(context, 'Invalid Email',
                'Please fill in the correct Email Address');
          } else if (_passwordController.text.length < 4) {
            displayDialog(context, 'Invalid Password',
                'The Password should be at least 4 characters');
          } else if (_passwordConfirmationController.text !=
              _passwordController.text) {
            displayDialog(context, 'Incorrect Password',
                'Please check your Password and Confirmation Password');
          } else {
            displayDialog(context, 'Invalid Credentials',
                'The account with this credential was created. Please create a new one');
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SignupBackground(
      child: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 65, right: 65),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Nusatutor_logo_transparant.png',
                      width: 100,
                      height: 87.34,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign Up',
                      style: blackSemiBoldTextStyle.copyWith(fontSize: 30),
                    ),
                    nameInput(),
                    emailInput(),
                    passwordInput(),
                    passwordConfirmationInput(),
                    /* TODO: TO BE MOVED ASAP! */
                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 25,
                      ),
                      child: ElevatedButton(
                          onPressed: _isLoading ? null : () => _submit(),
                          child: Text(
                            _isLoading ? 'Creating....' : 'Sign Up',
                            style: whiteTextStyle.copyWith(fontSize: 16),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(whiteColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
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
}
