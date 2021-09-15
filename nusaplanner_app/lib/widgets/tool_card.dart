import 'package:flutter/material.dart';
import 'package:nusaplanner_app/classes/tool.dart';
import 'package:nusaplanner_app/theme.dart';

class ToolCard extends StatelessWidget {
  final Tool tool;

  ToolCard(this.tool);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 140,
        color: darkPurpleColor,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              tool.name,
              style: whiteTextStyle.copyWith(fontSize: 16),
            ),
            Image.asset(
              tool.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
