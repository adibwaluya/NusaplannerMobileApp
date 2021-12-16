import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/classes/checkbox.dart';
import 'package:nusaplanner_app/classes/todolist.dart';
import 'package:nusaplanner_app/classes/user_sp.dart';
import 'package:nusaplanner_app/pages/Feed/components/loading_calendar.dart';
import 'package:provider/provider.dart';

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
  String userTodoListTest = "";
  int? userIdInt;
  var valueInt;
  var valueBool;
  late var token;
  Todolist? createdTodoList;
  bool selected = false;

  bool listLanguageOne(int a) => a == 0 ? false : true;
  bool visibilityTest = false;

  var lanOne;
  var lanTwo;
  var lanThree;
  var docOne;
  var docTwo;
  var docThree;
  var baOne;
  var visaOne;
  var visaTwo;
  var anpOne;
  var anpTwo;
  var depOne;
  var depTwo;
  String testlanOne = "";

  late Future testApi;
  late Future testApiTwo;
  late Future testApiThree;
  void test;

  late Future<Todolist>? _func;

  @override
  void initState() {
    _func = Auth().fetchTodolist();
    // _getTodolistApi();
    super.initState();

    userTodoListTest = UserSimplePreferences.getTodolist() ?? "";
    // print(userTodoListTest);
    dateEndString = UserSimplePreferences.getDate() ?? "";
  }

  final storage = FlutterSecureStorage();

  void apiCheckbox(property, value) async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).updateTodoList(
        data: {'property': property, 'value': value, 'user_id': userIdString},
        success: () {},
        error: () {});
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(text),
        ),
      );

  void _getTodolistApi() async {
    Provider.of<Auth>(context, listen: false)
        .attemptTodoList(token: await storage.read(key: 'token'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder<Todolist>(
      future: _func,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Widget buildSingleCheckbox(CheckBoxState checkbox) =>
              CheckboxListTile(
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                controlAffinity: ListTileControlAffinity.trailing,
                activeColor: greenColor,
                value: checkbox.value,
                title: Text(
                  checkbox.title,
                  style: blackRegularTextStyle.copyWith(fontSize: 12),
                ),
                onChanged: (value) => setState(() {
                  /* checkbox.value = value!; */
                  this.selected = !this.selected;
                  this.selected ? valueInt = 1 : valueInt = 0;
                  apiCheckbox(checkbox.property, valueInt);
                }),
              );

          /* final firstTodolists = [
            CheckBoxState(
                title: 'Register to a language course',
                value: snapshot.data!.planningLanguageOne == 1 ? true : false,
                property: "planning_language_one"),
            CheckBoxState(
                title: 'Taking Exam to earn the language certificate',
                value: snapshot.data!.planningLanguageTwo == 1 ? true : false,
                property: "planning_language_two"),
            CheckBoxState(
                title: 'Earn the language certificate',
                value: snapshot.data!.planningLanguageThree == 1 ? true : false,
                property: "planning_language_three"),
          ];
          final secondTodolists = [
            CheckBoxState(
                title: 'Copy the necessary documents',
                value: snapshot.data!.planningDocumentOne == 1 ? true : false,
                property: "planning_document_one"),
            CheckBoxState(
                title: 'Translate all the documents',
                value: snapshot.data!.planningDocumentTwo == 1 ? true : false,
                property: "planning_document_two"),
            CheckBoxState(
                title: 'Certify the documents',
                value: snapshot.data!.planningDocumentThree == 1 ? true : false,
                property: "planning_document_three"),
          ];
          final thirdTodolists = [
            CheckBoxState(
                title: 'Create your Bank Account',
                value:
                    snapshot.data!.planningBankAccountOne == 1 ? true : false,
                property: "planning_bankAccount_one"),
          ];
          final fourthTodolists = [
            CheckBoxState(
                title: 'Apply for Visa',
                value: snapshot.data!.planningVisaOne == 1 ? true : false,
                property: "planning_visa_one"),
            CheckBoxState(
                title: 'Collect your Visa from the embassy',
                value: snapshot.data!.planningVisaTwo == 1 ? true : false,
                property: "planning_visa_two"),
          ];
          final fifthTodolists = [
            CheckBoxState(
                title: 'Apply for entrance examination (ANP)',
                value: snapshot.data!.planningAnpOne == 1 ? true : false,
                property: "planning_anp_one"),
            CheckBoxState(
                title:
                    'Receive the admission for the entrance examination (Zulassung)',
                value: snapshot.data!.planningAnpTwo == 1 ? true : false,
                property: "planning_anp_two")
          ];
          final sixthTodolists = [
            CheckBoxState(
                title: 'Buy Plane Ticket',
                value: snapshot.data!.planningDepartureOne == 1 ? true : false,
                property: "planning_departure_one"),
            CheckBoxState(
                title: 'Depart to Germany',
                value: snapshot.data!.planningDepartureTwo == 1 ? true : false,
                property: "planning_departure_two")
          ]; */
          // test = print(data!.map((todolist) => todolist.planningLanguageOne));
          return SingleChildScrollView(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
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
                                  style: blackRegularTextStyle.copyWith(
                                      fontSize: 16),
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
                                  style: blackRegularTextStyle.copyWith(
                                      fontSize: 16),
                                ),
                                Text(
                                  dateEndString,
                                  style: blackSemiBoldTextStyle.copyWith(
                                      fontSize: 25),
                                ),
                                Visibility(
                                  visible: true,
                                  child: Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        // _loadUserId();
                                        return Text(
                                          userIdString =
                                              auth.user.id.toString(),
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 25),
                                        );
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  ),
                                ),
                                /* Visibility(
                                    visible: false,
                                    child: Text(
                                        (snapshot.data!.planningLanguageOne)
                                            .toString()),
                                  ), */
                                /* Consumer<Auth>(
                                    builder: (context, auth, child) {
                                      if (auth.loggedIn) {
                                        // _loadUserId();
                                        return Text(
                                          /* (data!
                                              .map((todolist) =>
                                                  todolist.planningLanguageOne)
                                              .toString()) */
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
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      leading: Image.asset(
                                        'assets/icons/planning_language_icon.png',
                                        width: size.width * 0.12,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Language Course',
                                            style: blackSemiBoldTextStyle
                                                .copyWith(fontSize: 18),
                                          ),
                                          Text(
                                            'Register, Examination, Certificate',
                                            style: blackRegularTextStyle
                                                .copyWith(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      children: [
                                        /* ...firstTodolists
                                              .map(buildSingleCheckbox)
                                              .toList(), */
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanOne = false;
                                              var valueIntOne;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanOne = snapshot
                                                            .data!
                                                            .planningLanguageOne ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Register to a language course',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanOne =
                                                      !selectedLanOne;
                                                  /* this.selected =
                                                        !this.selected; */
                                                  selectedLanOne
                                                      ? valueIntOne = 1
                                                      : valueIntOne = 0;
                                                  apiCheckbox(
                                                      'planning_language_one',
                                                      valueIntOne);

                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoadingToCalendar()),
                                                  );
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanTwo;
                                              var valueIntTwo;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanTwo = snapshot
                                                            .data!
                                                            .planningLanguageTwo ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Taking Exam to earn the language certificate',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanTwo =
                                                      !selectedLanTwo;
                                                  selectedLanTwo
                                                      ? valueIntTwo = 1
                                                      : valueIntTwo = 0;
                                                  apiCheckbox(
                                                      'planning_language_two',
                                                      valueIntTwo);

                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoadingToCalendar()),
                                                          (route) => false);
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanThree;
                                              var valueIntThree;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanThree = snapshot
                                                            .data!
                                                            .planningLanguageThree ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Earn the language certificate',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanThree =
                                                      !selectedLanThree;
                                                  selectedLanThree
                                                      ? valueIntThree = 1
                                                      : valueIntThree = 0;
                                                  apiCheckbox(
                                                      'planning_language_three',
                                                      valueIntThree);

                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoadingToCalendar()),
                                                          (route) => false);
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        )
                                      ]
                                      /* [
                                          /* ...firstTodolists
                                              .map((todolist) =>
                                                  buildSingleCheckbox(todolist))
                                              .toList(), */
                  
                                          ...firstTodolists
                                              .map(buildSingleCheckbox)
                                              .toList(),
                                            */

                                      ,
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
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      leading: Image.asset(
                                        'assets/icons/planning_document_icon.png',
                                        width: size.width * 0.12,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Document Preparation',
                                            style: blackSemiBoldTextStyle
                                                .copyWith(fontSize: 18),
                                          ),
                                          Text(
                                            'Copy, Translate, and Certify all necessary documents',
                                            style: blackRegularTextStyle
                                                .copyWith(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      children: [
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanOne = false;
                                              var valueIntOne;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanOne = snapshot
                                                            .data!
                                                            .planningDocumentOne ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Copy the necessary documents',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanOne =
                                                      !selectedLanOne;
                                                  /* this.selected =
                                                        !this.selected; */
                                                  selectedLanOne
                                                      ? valueIntOne = 1
                                                      : valueIntOne = 0;
                                                  apiCheckbox(
                                                      'planning_document_one',
                                                      valueIntOne);

                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoadingToCalendar()),
                                                  );
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanTwo;
                                              var valueIntTwo;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanTwo = snapshot
                                                            .data!
                                                            .planningDocumentTwo ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Translate all the documents',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanTwo =
                                                      !selectedLanTwo;
                                                  selectedLanTwo
                                                      ? valueIntTwo = 1
                                                      : valueIntTwo = 0;
                                                  apiCheckbox(
                                                      'planning_document_two',
                                                      valueIntTwo);

                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoadingToCalendar()),
                                                          (route) => false);
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanThree;
                                              var valueIntThree;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanThree = snapshot
                                                            .data!
                                                            .planningDocumentThree ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Certify the documents',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanThree =
                                                      !selectedLanThree;
                                                  selectedLanThree
                                                      ? valueIntThree = 1
                                                      : valueIntThree = 0;
                                                  apiCheckbox(
                                                      'planning_document_three',
                                                      valueIntThree);

                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoadingToCalendar()),
                                                          (route) => false);
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        )
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
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      leading: Image.asset(
                                        'assets/icons/planning_bank_icon.png',
                                        width: size.width * 0.12,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Bank Account',
                                            style: blackSemiBoldTextStyle
                                                .copyWith(fontSize: 18),
                                          ),
                                          Text(
                                            'Create a Bank Account',
                                            style: blackRegularTextStyle
                                                .copyWith(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      children: [
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanOne = false;
                                              var valueIntOne;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanOne = snapshot
                                                            .data!
                                                            .planningBankAccountOne ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Create your Bank Account',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanOne =
                                                      !selectedLanOne;
                                                  /* this.selected =
                                                        !this.selected; */
                                                  selectedLanOne
                                                      ? valueIntOne = 1
                                                      : valueIntOne = 0;
                                                  apiCheckbox(
                                                      'planning_bankAccount_one',
                                                      valueIntOne);

                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoadingToCalendar()),
                                                  );
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),

                                        /* ...thirdTodolists
                                              .map(buildSingleCheckbox)
                                              .toList(), */
                                        /* Consumer<Auth>(
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
                                                        .planningBankAccountOne),
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
                                      ), */
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
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      leading: Image.asset(
                                        'assets/icons/planning_visa_icon.png',
                                        width: size.width * 0.12,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Visa',
                                            style: blackSemiBoldTextStyle
                                                .copyWith(fontSize: 18),
                                          ),
                                          Text(
                                            'Apply and collect the visa',
                                            style: blackRegularTextStyle
                                                .copyWith(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      children: [
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanOne = false;
                                              var valueIntOne;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: snapshot.data!
                                                            .planningVisaOne ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Apply for Visa',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanOne =
                                                      !selectedLanOne;
                                                  /* this.selected =
                                                        !this.selected; */
                                                  selectedLanOne
                                                      ? valueIntOne = 1
                                                      : valueIntOne = 0;
                                                  apiCheckbox(
                                                      'planning_visa_one',
                                                      valueIntOne);

                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoadingToCalendar()),
                                                  );
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanTwo;
                                              var valueIntTwo;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanTwo = snapshot
                                                            .data!
                                                            .planningVisaTwo ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Collect your Visa from the embassy',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanTwo =
                                                      !selectedLanTwo;
                                                  selectedLanTwo
                                                      ? valueIntTwo = 1
                                                      : valueIntTwo = 0;
                                                  apiCheckbox(
                                                      'planning_visa_two',
                                                      valueIntTwo);

                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoadingToCalendar()),
                                                          (route) => false);
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        /* ...fourthTodol
                                          ists
                                              .map(buildSingleCheckbox)
                                              .toList(), */
                                        /* Consumer<Auth>(
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
                                                    auth.todolist.planningVisaOne),
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
                                                    auth.todolist.planningVisaTwo),
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
                                      ), */
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
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      leading: Image.asset(
                                        'assets/icons/planning_anp_icon.png',
                                        width: size.width * 0.12,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Aufnahmeprüfung',
                                            style: blackSemiBoldTextStyle
                                                .copyWith(fontSize: 18),
                                          ),
                                          Text(
                                            'Apply and receive the admission for the entrance exam (ANP)',
                                            style: blackRegularTextStyle
                                                .copyWith(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      children: [
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanOne = false;
                                              var valueIntOne;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanOne = snapshot
                                                            .data!
                                                            .planningAnpOne ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Apply for entrance examination (ANP)',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanOne =
                                                      !selectedLanOne;
                                                  /* this.selected =
                                                        !this.selected; */
                                                  selectedLanOne
                                                      ? valueIntOne = 1
                                                      : valueIntOne = 0;
                                                  apiCheckbox(
                                                      'planning_anp_one',
                                                      valueIntOne);

                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoadingToCalendar()),
                                                  );
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanTwo;
                                              var valueIntTwo;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: snapshot.data!
                                                            .planningAnpTwo ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Receive the admission for the entrance examination (Zulassung)',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanTwo =
                                                      !selectedLanTwo;
                                                  selectedLanTwo
                                                      ? valueIntTwo = 1
                                                      : valueIntTwo = 0;
                                                  apiCheckbox(
                                                      'planning_anp_two',
                                                      valueIntTwo);

                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoadingToCalendar()),
                                                          (route) => false);
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        /* ...fifthTodolists
                                              .map(buildSingleCheckbox)
                                              .toList(), */
                                        /* Consumer<Auth>(
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
                                                    auth.todolist.planningAnpOne),
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
                                                    auth.todolist.planningAnpTwo),
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
                                      ), */
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
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      leading: Image.asset(
                                        'assets/icons/planning_departure_icon.png',
                                        width: size.width * 0.12,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Departure',
                                            style: blackSemiBoldTextStyle
                                                .copyWith(fontSize: 18),
                                          ),
                                          Text(
                                            'Buy the plane ticket and schedule your departure',
                                            style: blackRegularTextStyle
                                                .copyWith(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      children: [
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanOne = false;
                                              var valueIntOne;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanOne = snapshot
                                                            .data!
                                                            .planningDepartureOne ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Buy Plane Ticket',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanOne =
                                                      !selectedLanOne;
                                                  /* this.selected =
                                                        !this.selected; */
                                                  selectedLanOne
                                                      ? valueIntOne = 1
                                                      : valueIntOne = 0;
                                                  apiCheckbox(
                                                      'planning_departure_one',
                                                      valueIntOne);

                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoadingToCalendar()),
                                                  );
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        Consumer<Auth>(
                                          builder: (context, auth, child) {
                                            if (auth.loggedIn) {
                                              var selectedLanTwo;
                                              var valueIntTwo;
                                              return CheckboxListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                activeColor: greenColor,
                                                value: selectedLanTwo = snapshot
                                                            .data!
                                                            .planningDepartureTwo ==
                                                        1
                                                    ? true
                                                    : false /* snapshot.data!
                                                              .planningLanguageOne ==
                                                          1
                                                      ? true
                                                      : false */
                                                ,
                                                title: Text(
                                                  'Depart to Germany',
                                                  style: blackRegularTextStyle
                                                      .copyWith(fontSize: 12),
                                                ),
                                                onChanged: (value) =>
                                                    setState(() {
                                                  selectedLanTwo =
                                                      !selectedLanTwo;
                                                  selectedLanTwo
                                                      ? valueIntTwo = 1
                                                      : valueIntTwo = 0;
                                                  apiCheckbox(
                                                      'planning_departure_two',
                                                      valueIntTwo);

                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoadingToCalendar()),
                                                          (route) => false);
                                                  displayDialog(
                                                      context,
                                                      "Checklist Updated!",
                                                      "You successfully modified the checklist");
                                                }),
                                              );
                                            }
                                            return Text('No data');
                                          },
                                        ),
                                        /* ...sixthTodolists
                                              .map(buildSingleCheckbox)
                                              .toList(), */
                                        /* Consumer<Auth>(
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
                                                        .planningDepartureOne),
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
                                                        .planningDepartureTwo),
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
                                      ), */
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
          );
        } else if (snapshot.hasError) {
          /* Error */
          return AlertDialog(
            title: Text(
              'An Error Occured!',
              textAlign: TextAlign.center,
            ),
            content: Text("${snapshot.error}"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Go Back'))
            ],
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                'This may take some time...',
                style: blackRegularTextStyle.copyWith(fontSize: 16),
              )
            ],
          ),
        );
      },
    ));
  }
}
