// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields

import 'package:flutter/material.dart';
import '../../model/place_model.dart';
import '../HomeScreen/app_bar_home.dart';
import '../DetailPlaceScreen/detail_place.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Place> _filteredPlaces = [];
  List<Place> _defaultPlaces = [];

  @override
  void initState() {
    super.initState();
    _defaultPlaces = popularplace.take(2).toList(); // Default two cards
    _filteredPlaces = _defaultPlaces; // Initialize filteredPlaces with default
    _searchController.addListener(_filterPlaces);
  }

  void _filterPlaces() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredPlaces = _defaultPlaces; // Show default two cards when empty
      } else {
        _filteredPlaces = popularplace.where((place) {
          return place.title.toLowerCase().contains(query) ||
              place.location.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                // MaterialPageRoute(
                //   builder: (context) => TopDestinationScreen(),
                // ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              size: 28,
              color: Colors.white,
            )),
        title: Center(
          child: Text(
            'Search',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {
                  {}
                },
              ),
              Positioned(
                right: 10,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 15,
                    minHeight: 15,
                  ),
                  child: const Center(
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
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
            SizedBox(height: 20),
            // List of Results
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Expanded(
                  child: _filteredPlaces.isNotEmpty
                      ? ListView.builder(
                          itemCount: _filteredPlaces.length,
                          itemBuilder: (context, index) {
                            final place = _filteredPlaces[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPlace(
                                      place: place,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                margin: EdgeInsets.only(top: 15.0),
                                child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              spreadRadius: 2.0,
                                              offset: Offset(1, 1))
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: SizedBox(
                                                height: 150,
                                                width: 150,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.asset(
                                                    place.image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 5,
                                              left: 0,
                                              right: -100,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color: Colors.white,
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  place.title,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.purple,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                place.location,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                              Text(
                                                place.review,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 10,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                ),
                                                Text(
                                                  '${place.rate}',
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "No places found",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
