// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import '../navbar_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './app_bar_home.dart';
import 'topdestination.dart';
import 'carousel_image.dart';
import './popular_place_home.dart';
import '../DetailPlaceScreen/detail_place.dart';
import '../SearchScreen/search_screen.dart';
import '../../model/place_model.dart';
import './search_bar_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section (Blue Background)
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
              child: Column(
                children: [
                  // AppBar
                  AppBarHome(),
                  // Search Bar

                  Padding(
                    padding: EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () {
                        {}
                      },
                      child: TextField(
                        readOnly: true, // Makes the TextField non-editable
                        onTap: () {
                          // Navigate to the search screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()),
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.filter_list),
                          hintStyle: TextStyle(color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Top Destination
                  Topdestination(),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                  )
                ],
              ),
            ),

            // Bottom Section (White Background)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Carousel Image
                  CAROUSELIMAGE(),
                  // Popular Place
                  PopularPlaceHome(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
