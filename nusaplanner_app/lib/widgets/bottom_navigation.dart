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
      bottomNavigationBar: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          unselectedItemColor: darkPurpleColor,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Feed",
              backgroundColor: lightPurpleColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: "Plan",
              backgroundColor: lightPurpleColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Inbox",
              backgroundColor: lightPurpleColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: lightPurpleColor,
            ),
          ],
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
