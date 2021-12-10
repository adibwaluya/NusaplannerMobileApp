import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nusaplanner_app/auth/auth.dart';
import 'package:nusaplanner_app/classes/overview.dart';
import 'package:nusaplanner_app/classes/preparation.dart';
import 'package:nusaplanner_app/classes/tool.dart';
import 'package:nusaplanner_app/models/carousel_model.dart';
import 'package:nusaplanner_app/pages/Feed/components/feed_background.dart';
import 'package:nusaplanner_app/pages/inbox/inbox_page.dart';
import 'package:nusaplanner_app/pages/profile/update_date_page.dart';
import 'package:nusaplanner_app/widgets/article_card.dart';
import 'package:nusaplanner_app/widgets/course_card.dart';
import 'package:nusaplanner_app/widgets/overview_card.dart';
import 'package:nusaplanner_app/widgets/prep_card.dart';
import 'package:nusaplanner_app/widgets/tool_card.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';
import 'launch_chat.dart';
import 'loading_calendar.dart';

class FeedBody extends StatefulWidget {
  const FeedBody({Key? key}) : super(key: key);

  @override
  State<FeedBody> createState() => _FeedBodyState();
}

class _FeedBodyState extends State<FeedBody> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(top: edge),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Your Dashboard',
                style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Prepare your study to Germany thoroughly!',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: spaceToHeader,
            ),
            CarouselModel(),
            SizedBox(
              height: spaceToHeader,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge, top: edge),
              child: Text(
                'General Overview',
                style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Bachelor Study to Germany',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: spaceToHeader,
            ),
            Container(
              child: Column(
                children: [
                  PreparationCard(
                    Preparation(
                      1,
                      'Language Course',
                      'assets/images/language.png',
                      "3.5",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PreparationCard(
                    Preparation(
                      2,
                      'List of Documents',
                      'assets/images/documents.png',
                      "1",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PreparationCard(
                    Preparation(
                      3,
                      'Visa',
                      'assets/images/visa.png',
                      "1.5",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PreparationCard(
                    Preparation(
                      3,
                      'Entrance Exam',
                      'assets/images/exam.png',
                      "1.5",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PreparationCard(
                    Preparation(
                      3,
                      'Departure',
                      'assets/images/departure.png',
                      "1",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge, top: edge),
              child: Text(
                'Tools',
                style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Necessary instruments which can help you prepare your study',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: spaceToHeader,
            ),
            Container(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: edge,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return UpdateDatePage();
                    })),
                    child: ToolCard(
                      Tool('Calendar', 'assets/images/calendar.png'),
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(whiteColor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffF6F7F8))),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Consumer<Auth>(
                    builder: (context, auth, child) {
                      if (auth.loggedIn) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () => Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return LaunchChat();
                                    })),
                            child: ToolCard(
                              Tool('Live Chat', 'assets/images/chat.png'),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        whiteColor),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xffF6F7F8))),
                          ),
                        );
                      }
                      return Text('No data');
                    },
                  ),
                ],
              ),
            ),
            /*  SizedBox(
              height: spaceToHeader,
            ), */
          ],
        ),
      ),
    );
  }
}
