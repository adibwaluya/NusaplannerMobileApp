import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/feed_page.dart';
import 'package:nusaplanner_app/pages/inbox/inbox_page.dart';
import 'package:nusaplanner_app/pages/plan/plan_page.dart';
import 'package:nusaplanner_app/pages/profile/profile_page.dart';
import 'package:nusaplanner_app/theme.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final screens = [
    FeedPage(),
    PlanPage(),
    InboxPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: darkPurpleColor,
          unselectedItemColor: whiteColor,
          selectedFontSize: 0,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              backgroundColor: lightPurpleColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: '',
              backgroundColor: lightPurpleColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: '',
              backgroundColor: lightPurpleColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
              backgroundColor: lightPurpleColor,
            ),
          ],
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
