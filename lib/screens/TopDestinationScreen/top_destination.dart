// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../HomeScreen/hearticon.dart';

class TopDestinationScreen extends StatefulWidget {
  const TopDestinationScreen({super.key});

  @override
  State<TopDestinationScreen> createState() => _TopDestinationScreenState();
}

class _TopDestinationScreenState extends State<TopDestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section (App Bar and Search Bar)
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
              child: Column(
                children: [
                  // App Bar
                  Padding(
                    padding: EdgeInsets.only(top: 40, right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Top Destination',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.notifications_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Handle notification action
                              },
                            ),
                            Positioned(
                              right: 14,
                              top: 8,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 10,
                                  minHeight: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Search Bar
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 40),
                    child: TextField(
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
                ],
              ),
            ),
            // Bottom Section (Cards)
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ButtomNavBar(),
    );
  }

  // Reusable method to build a place card
  Widget buildPlaceCard(
      BuildContext context, String imageUrl, String place, String location) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image Section
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, right: 5.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: HeartClickBtn(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Details Section
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place,
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue[400],
                        size: 20,
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          '5.0',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
