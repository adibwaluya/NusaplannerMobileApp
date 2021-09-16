import 'package:flutter/material.dart';
import 'package:nusaplanner_app/theme.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 300,
        color: greyColor,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/Kelas_image_sample.png',
                  width: 250,
                  height: 158,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Mulai Kelas: 1 Juli 2021',
                style: greyTextStyle.copyWith(fontSize: 10),
              ),
              Text(
                'Persiapan Deutsch ANP Studienkolleg\nTeil 1',
                style: blackSemiBoldTextStyle.copyWith(fontSize: 12),
              ),
              Text(
                'Tutor: Ebin Ardiansyah',
                style: greyTextStyle.copyWith(fontSize: 10),
              ),
              SizedBox(
                height: spaceTextIconOverview,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Ikuti Kelas',
                    style: whiteTextStyle.copyWith(fontSize: 12),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(whiteColor),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(darkPurpleColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
