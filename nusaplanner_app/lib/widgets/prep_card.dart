import 'package:flutter/material.dart';
import 'package:nusaplanner_app/classes/preparation.dart';
import 'package:nusaplanner_app/theme.dart';

class PreparationCard extends StatelessWidget {
  final Preparation preparation;

  PreparationCard(this.preparation);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.asset(
                    preparation.imageUrl,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 179,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  preparation.name,
                  style: blackSemiBoldTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text.rich(
                  TextSpan(
                      text: '${preparation.duration}',
                      style: darkPurpleTextStyle.copyWith(fontSize: 16),
                      children: [
                        TextSpan(
                          text: ' month(s) of preparation',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Click for further info...',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
