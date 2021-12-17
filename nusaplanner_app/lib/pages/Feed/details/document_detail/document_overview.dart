import 'package:flutter/material.dart';
import 'package:nusaplanner_app/pages/Feed/details/document_detail/document_screen_one.dart';
import 'package:nusaplanner_app/widgets/my_header.dart';

import '../../../../theme.dart';

class DocumentOverviewScreen extends StatelessWidget {
  const DocumentOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyHeader(
              image: "assets/images/visa_one.png",
              textTop: "List of\nDocuments",
              textBottom: "Overview",
              offset: 0,
              iconleft: true,
              colorValueOne: 0xFF756300,
              colorValueTwo: 0xFFFFED8A,
            ),
            Center(
              child: Text(
                'Overview',
                style: blackSemiBoldTextStyle.copyWith(fontSize: spaceThirty),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                        text:
                            'You might have taken a look on other preparation steps. Different kinds of documents are mentioned on each steps. ',
                        style: blackLightTextStyle.copyWith(fontSize: 16),
                        children: [
                          TextSpan(
                              text:
                                  'It is recommended that you read other sections thoroughly, ',
                              style:
                                  blackSemiBoldTextStyle.copyWith(fontSize: 16),
                              children: [
                                TextSpan(children: [
                                  TextSpan(
                                    text:
                                        'so that you can understand what this section will encompass.',
                                    style: blackLightTextStyle.copyWith(
                                        fontSize: 16),
                                  ),
                                ])
                              ]),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'The documents from each section will be summarized. Some of the documents can only be viewed by visiting the original websites. The sequence of the list can be seen below:',
                    style: blackLightTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Documents for Language Courses',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '2. Documents for Visa and Bank Account',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '3. Documents for Entrance Exam (ANP) Application',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '4. Documents for your departure',
                    style: blackRegularTextStyle.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Return",
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(whiteColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(darkPurpleColor),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DocumentScreenOne();
                      }));
                    },
                    child: Text(
                      "Start",
                      style: whiteTextStyle.copyWith(fontSize: 16),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(whiteColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(darkPurpleColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
