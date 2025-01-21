// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import '../HomeScreen/hearticon.dart';
import '../../model/place_model.dart';

class DecoverScreen extends StatefulWidget {
  const DecoverScreen({super.key});

  @override
  State<DecoverScreen> createState() => _DecoverScreenState();
}

class _DecoverScreenState extends State<DecoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //searchappbar
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //topbar
                      Padding(
                        padding: EdgeInsets.only(top: 40, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Decover Place',
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
                                  icon: const Icon(
                                    Icons.notifications_outlined,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => NotificationService()),
                                    // );
                                  },
                                ),
                                Positioned(
                                  right: 14,
                                  top: 8,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 10,
                                      minHeight: 10,
                                    ),
                                    // child: const Center(
                                    //   child: Text(
                                    //     '0',
                                    //     style: TextStyle(
                                    //       color: Colors.white,
                                    //       fontSize: 12,
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //searchbar
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
                                vertical: 15.0, horizontal: 16.0),
                          ),
                        ),
                      ),
                      //topplace
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildPlaceCard(context),
                                buildPlaceCard(context),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
      // bottomNavigationBar: ButtomNavBar(),
    );
  }

  Widget buildPlaceCard(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Container(
        height: 300,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://www.planetware.com/wpimages/2020/07/cambodia-top-places-to-visit-kampot.jpg',
                    ),
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
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Irence Red VedVet',
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
                        'South Korea',
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
