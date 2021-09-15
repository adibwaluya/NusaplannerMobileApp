import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselModel extends StatelessWidget {
  const CarouselModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: [
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: AssetImage('assets/images/Kelas_1_sample.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: AssetImage('assets/images/Kelas_2_sample.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                image: AssetImage('assets/images/Kelas_3_sample.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}
