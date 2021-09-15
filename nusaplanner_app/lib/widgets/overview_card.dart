import 'package:flutter/material.dart';
import 'package:nusaplanner_app/classes/overview.dart';
import 'package:nusaplanner_app/theme.dart';

class OverviewCard extends StatelessWidget {
  final Overview overview;

  OverviewCard(this.overview);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        color: lightPurpleColor,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              overview.name,
              style: blackRegularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: spaceTextIconOverview,
            ),
            Image.asset(
              overview.imageUrl,
              width: 79,
              height: 80,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
