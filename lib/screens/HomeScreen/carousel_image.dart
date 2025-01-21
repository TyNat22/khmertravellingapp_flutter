// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CAROUSELIMAGE extends StatefulWidget {
  const CAROUSELIMAGE({super.key});

  @override
  State<CAROUSELIMAGE> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CAROUSELIMAGE> {
  final List<String> imageUrls = [
    'images/sliderimages/angkorwat.jpg',
    'images/sliderimages/royalplace.jpg',
    'images/sliderimages/prasviha.jpg',
  ];
  static const placeName = [
    'Angkor Wat',
    'Royal Palace',
    'Preah Vihear Temple'
  ]; // List of place names
  static const province = [
    'Siem Reap',
    'Phnom Penh',
    'Preah Vihear'
  ]; // List of place names
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 280.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Container(
                    width: 420,
                    // height: 380,
                    // margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            placeName[_currentIndex],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            province[_currentIndex],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageUrls.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => {},
              child: Container(
                width: 50.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  shape: BoxShape.rectangle,
                  color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
