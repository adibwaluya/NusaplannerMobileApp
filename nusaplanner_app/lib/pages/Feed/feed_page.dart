import 'package:flutter/material.dart';
import 'package:nusaplanner_app/models/carousel_model.dart';
import 'package:nusaplanner_app/theme.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: edge, top: edge),
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
          SizedBox(
            height: spaceBetweenSection,
          ),
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
                      padding: EdgeInsets.only(left: spaceListBox),
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
                            style: blackMediumTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: spaceListBox),
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
                            style: blackMediumTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: spaceListBox),
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
                            style: blackMediumTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: spaceListBox),
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
                            style: blackMediumTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
