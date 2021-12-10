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
        width: 150,
        height: 150,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Image.asset(
              tool.imageUrl,
              width: 150,
              height: 90,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              tool.name,
              style: blackRegularTextStyle.copyWith(fontSize: 16),
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
