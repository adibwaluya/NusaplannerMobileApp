import 'package:flutter/material.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/pages/profile/update_date_page.dart';
import 'package:nusaplanner_app/utils/dio.dart';
import 'package:nusaplanner_app/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class LoadingToCalendar extends StatefulWidget {
  const LoadingToCalendar({Key? key}) : super(key: key);

  @override
  _LoadingToCalendarState createState() => _LoadingToCalendarState();
}

class _LoadingToCalendarState extends State<LoadingToCalendar> {
  //here is the magic begins

  void _getTodolistApi() async {
    Provider.of<Auth>(context, listen: false)
        .attemptTodoList(token: await storage.read(key: 'token'));
  }

  @override
  void initState() {
    _getTodolistApi();
    super.initState();
    //setting the seconds to 2, you can set as per your
    // convenience
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigation()),
          (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
