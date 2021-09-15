import 'package:flutter/material.dart';
import 'package:nusaplanner_app/theme.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: edge,
          horizontal: edge,
        ),
        child: ListView(
          children: [
            Text(
              'Dashboard Kamu',
              style: blackSemiBoldTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            Text(
              'Persiapkan Studi Kamu dengan Matang',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
      )),
    );
  }
}
