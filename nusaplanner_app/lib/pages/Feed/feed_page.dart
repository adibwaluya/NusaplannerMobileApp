import 'package:flutter/material.dart';
import 'package:nusaplanner_app/classes/overview.dart';
import 'package:nusaplanner_app/classes/tool.dart';
import 'package:nusaplanner_app/models/carousel_model.dart';
import 'package:nusaplanner_app/theme.dart';
import 'package:nusaplanner_app/widgets/overview_card.dart';
import 'package:nusaplanner_app/widgets/tool_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: edge),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Dashboard Kamu',
                style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Persiapkan Studi Kamu dengan Matang',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: spaceToHeader,
            ),
            CarouselModel(),
            Padding(
              padding: EdgeInsets.only(left: edge, top: edge),
              child: Text(
                'Tugas Minggu Ini',
                style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Selalu Update To Do List Kamu!',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: spaceToHeader,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge, right: edge),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  color: greyColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: spaceListBoxLeft, top: spaceListBoxVertical),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/Document_icon.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: spaceIconText,
                            ),
                            Text(
                              'Terjemah Ijazah dan beglaubigen',
                              style:
                                  blackMediumTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: spaceListBoxLeft),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/Document_icon.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: spaceIconText,
                            ),
                            Text(
                              'Terjemah Rapor Kelas XII semester akhir',
                              style:
                                  blackMediumTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: spaceListBoxLeft),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/Translate_icon.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: spaceIconText,
                            ),
                            Text(
                              'Tambah Kosakata',
                              style:
                                  blackMediumTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: spaceListBoxLeft,
                            bottom: spaceListBoxVertical),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/Translate_icon.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: spaceIconText,
                            ),
                            Text(
                              'Ujian Sertifikat A1',
                              style:
                                  blackMediumTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge, top: edge),
              child: Text(
                'Gambaran Umum',
                style: blackSemiBoldTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Kuliah S1 ke Jerman',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: spaceToHeader,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: edge,
                  ),
                  OverviewCard(
                    Overview('Dokumen', 'assets/icons/Document_icon.png'),
                  ),
                  SizedBox(
                    width: edge,
                  ),
                  OverviewCard(
                    Overview('Bahasa', 'assets/icons/Translate_icon.png'),
                  ),
                  SizedBox(
                    width: edge,
                  ),
                  OverviewCard(
                    Overview('Akomodasi', 'assets/icons/Accomodation_icon.png'),
                  ),
                  SizedBox(
                    width: edge,
                  ),
                  OverviewCard(
                    Overview('Dokumen', 'assets/icons/Document_icon.png'),
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
                'Instrumen yang dapat membantu\npersiapan studimu',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: spaceToHeader,
            ),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: edge,
                  ),
                  ToolCard(
                    Tool('Jadwal', 'assets/icons/Jadwal_icon.png'),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ToolCard(
                    Tool('Kalendar', 'assets/icons/Kalendar_icon.png'),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
