import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/components/feed_body.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeedBody(),
    );
  }
}
