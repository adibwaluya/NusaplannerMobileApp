import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/classes/checkbox.dart';
import 'package:nusaplanner_app/classes/user_sp.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  bool? _checked = false;
  bool _isLoading = false;
  String dateEndString = "";
  String userIdString = "";
  int? userIdInt;
  // var valueInt;
  var valueBool;

  bool listLanguageOne(int a) => a == 0 ? false : true;
  bool listLanguageTwo(int a) => a == 0 ? false : true;
  bool listLanguageThree(int a) => a == 0 ? false : true;
  bool listDocumentOne(int a) => a == 0 ? false : true;
  bool listDocumentTwo(int a) => a == 0 ? false : true;
  bool listDocumentThree(int a) => a == 0 ? false : true;
  bool listBankOne(int a) => a == 0 ? false : true;
  bool listVisaOne(int a) => a == 0 ? false : true;
  bool listVisaTwo(int a) => a == 0 ? false : true;
  bool listAnpOne(int a) => a == 0 ? false : true;
  bool listAnpTwo(int a) => a == 0 ? false : true;
  bool listDepOne(int a) => a == 0 ? false : true;
  bool listDepTwo(int a) => a == 0 ? false : true;

  @override
  void initState() {
    super.initState();

    // _loadDate();
    dateEndString = UserSimplePreferences.getDate() ?? "";
    // _loadUserId();
    // _testLoadDate();
  }

  final storage = FlutterSecureStorage();

  // To be used asap
  /* 
  _loadDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dateEndString =
          (prefs.getString('userDateEnd') ?? ''); // Previously addDateEnd
    });
  } */

  /* _loadUserId() async {
    userIdString = (await storage.read(key: 'id'))!;
    setState(() {
      userIdInt = int.parse(userIdString);
    });
  } */

  /* final firstTodolists = [
    CheckBoxState(
        title: 'Register to a language course',
        value: ,
        property: "planning_language_one"),
    CheckBoxState(
        title: 'Taking Exam to earn the language certificate',
        property: "planning_language_two"),
    CheckBoxState(
        title: 'Earn the language certificate',
        property: "planning_language_three"),
  ];
  final secondTodolists = [
    CheckBoxState(
        title: 'Copy the necessary documents',
        property: "planning_document_one"),
    CheckBoxState(
        title: 'Translate all the documents',
        property: "planning_document_two"),
    CheckBoxState(
        title: 'Certify the documents', property: "planning_document_three"),
  ];
  final thirdTodolists = [
    CheckBoxState(
        title: 'Create your Bank Account',
        property: "planning_bankAccount_one"),
  ];
  final fourthTodolists = [
    CheckBoxState(title: 'Apply for Visa', property: "planning_visa_one"),
    CheckBoxState(
        title: 'Collect your Visa from the embassy',
        property: "planning_visa_two"),
  ];
  final fifthTodolists = [
    CheckBoxState(
        title: 'Apply for entrance examination (ANP)',
        property: "planning_anp_one"),
    CheckBoxState(
        title: 'Receive the admission for the entrance examination (Zulassung)',
        property: "planning_anp_two")
  ];
  final sixthTodolists = [
    CheckBoxState(
        title: 'Buy Plane Ticket', property: "planning_departure_one"),
    CheckBoxState(
        title: 'Depart to Germany', property: "planning_departure_two")
  ]; */

  void apiCheckbox(property, value) async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).updateTodoList(
        data: {'property': property, 'value': value, 'user_id': userIdString},
        success: () {},
        error: () {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/shapes/Ellipse_planning_bg.png',
                width: size.width * 1,
              ),
            ),
            ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 24.0),
                      child: Image.asset(
                        'assets/images/Planning_image.png',
                        width: size.width * 0.7,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Study Planning',
                            style: blackSemiBoldTextStyle.copyWith(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Step-By-Step mempersiapkan Studi ke Jerman tepat waktu dengan time management',
                            style: blackRegularTextStyle.copyWith(fontSize: 16),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Your Todolists',
                            style: blackSemiBoldTextStyle.copyWith(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'Your Preparation should be done on: ',
                            style: blackRegularTextStyle.copyWith(fontSize: 16),
                          ),
                          Text(
                            dateEndString,
                            style:
                                blackSemiBoldTextStyle.copyWith(fontSize: 25),
                          ),
                          Consumer<Auth>(
                            builder: (context, auth, child) {
                              if (auth.loggedIn) {
                                // _loadUserId();
                                return Text(
                                  userIdString = auth.user.id.toString(),
                                  style: blackSemiBoldTextStyle.copyWith(
                                      fontSize: 25),
                                );
                              }
                              return Text('No data');
                            },
                          ),
                          /* Consumer<Auth>(
                            builder: (context, auth, child) {
                              if (auth.loggedIn) {
                                // _loadUserId();
                                return Text(
                                  auth.todolist.planning_language_one
                                      .toString(),
                                  style: blackSemiBoldTextStyle.copyWith(
                                      fontSize: 25),
                                );
                              }
                              return Text('No data');
                            },
                          ), */
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                leading: Image.asset(
                                  'assets/icons/planning_language_icon.png',
                                  width: size.width * 0.12,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Language Course',
                                      style: blackSemiBoldTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Register, Examination, Certificate',
                                      style: blackRegularTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                children: [
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        bool valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Register to a language course',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool =
                                                listLanguageOne(auth.todolist
                                                    .planning_language_one),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  print(valIntToBool);
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_language_one",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Taking Exam to earn the language certificate',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool =
                                                listLanguageTwo(auth.todolist
                                                    .planning_language_two),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_language_two",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Earn the language certificate',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool =
                                                listLanguageThree(auth.todolist
                                                    .planning_language_three),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_language_three",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                leading: Image.asset(
                                  'assets/icons/planning_document_icon.png',
                                  width: size.width * 0.12,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Document Preparation',
                                      style: blackSemiBoldTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Copy, Translate, and Certify all necessary documents',
                                      style: blackRegularTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                children: [
                                  /* ...secondTodolists
                                      .map(buildSingleCheckbox)
                                      .toList(), */
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Copy the necessary documents',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool =
                                                listDocumentOne(auth.todolist
                                                    .planning_document_one),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_document_one",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Translate all the documents',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool =
                                                listDocumentTwo(auth.todolist
                                                    .planning_document_two),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_document_two",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Certify the documents',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool =
                                                listDocumentThree(auth.todolist
                                                    .planning_document_three),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_document_three",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                leading: Image.asset(
                                  'assets/icons/planning_bank_icon.png',
                                  width: size.width * 0.12,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bank Account',
                                      style: blackSemiBoldTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Create a Bank Account',
                                      style: blackRegularTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                children: [
                                  /* ...thirdTodolists
                                      .map(buildSingleCheckbox)
                                      .toList(), */
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Create your Bank Account',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool = listBankOne(
                                                auth.todolist
                                                    .planning_bankAccount_one),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_bankAccount_one",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                leading: Image.asset(
                                  'assets/icons/planning_visa_icon.png',
                                  width: size.width * 0.12,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Visa',
                                      style: blackSemiBoldTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Apply and collect the visa',
                                      style: blackRegularTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                children: [
                                  /* ...fourthTodolists
                                      .map(buildSingleCheckbox)
                                      .toList(), */
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Apply for Visa',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool = listVisaOne(
                                                auth.todolist
                                                    .planning_visa_one),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_visa_one",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Collect your Visa from the embassy',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool = listVisaTwo(
                                                auth.todolist
                                                    .planning_visa_two),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_visa_two",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                leading: Image.asset(
                                  'assets/icons/planning_anp_icon.png',
                                  width: size.width * 0.12,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Aufnahmeprüfung',
                                      style: blackSemiBoldTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Apply and receive the admission for the entrance exam (ANP)',
                                      style: blackRegularTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                children: [
                                  /* ...fifthTodolists
                                      .map(buildSingleCheckbox)
                                      .toList(), */
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Apply for entrance examination (ANP)',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool = listAnpOne(
                                                auth.todolist.planning_anp_one),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_anp_one",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Receive the admission for the entrance examination (Zulassung)',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool = listAnpTwo(
                                                auth.todolist.planning_anp_two),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_anp_two",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                leading: Image.asset(
                                  'assets/icons/planning_departure_icon.png',
                                  width: size.width * 0.12,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Departure',
                                      style: blackSemiBoldTextStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Buy the plane ticket and schedule your departure',
                                      style: blackRegularTextStyle.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                children: [
                                  /* ...sixthTodolists
                                      .map(buildSingleCheckbox)
                                      .toList(), */
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Buy Plane Ticket',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool = listDepOne(
                                                auth.todolist
                                                    .planning_departure_one),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_departure_one",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                  Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        var valIntToBool;
                                        return CheckboxListTile(
                                            title: Text(
                                              'Depart to Germany',
                                              style: blackRegularTextStyle
                                                  .copyWith(fontSize: 12),
                                            ),
                                            activeColor: greenColor,
                                            value: valIntToBool = listDepTwo(
                                                auth.todolist
                                                    .planning_departure_two),
                                            onChanged: (value) => setState(() {
                                                  var valueInt;
                                                  valIntToBool = value!;
                                                  valIntToBool
                                                      ? valueInt = 1
                                                      : valueInt = 0;
                                                  apiCheckbox(
                                                      "planning_departure_two",
                                                      valueInt);
                                                }));
                                      }
                                      return Text('false');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  /*  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        controlAffinity: ListTileControlAffinity.trailing,
        activeColor: greenColor,
        value: checkbox.value,
        title: Text(
          checkbox.title,
          style: blackRegularTextStyle.copyWith(fontSize: 12),
        ),
        onChanged: (value) => setState(() {
          checkbox.value = value!;
          checkbox.value ? valueInt = 1 : valueInt = 0;
          apiCheckbox(checkbox.property, valueInt);
        }),
      ); */
}
