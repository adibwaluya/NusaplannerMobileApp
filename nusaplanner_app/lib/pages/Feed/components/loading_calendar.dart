import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/profile/update_date_page.dart';

class LoadingToCalendar extends StatefulWidget {
  const LoadingToCalendar({Key? key}) : super(key: key);

  @override
  _LoadingToCalendarState createState() => _LoadingToCalendarState();
}

class _LoadingToCalendarState extends State<LoadingToCalendar> {
  //here is the magic begins
  @override
  void initState() {
    super.initState();
    //setting the seconds to 2, you can set as per your
    // convenience
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => UpdateDatePage()),
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
