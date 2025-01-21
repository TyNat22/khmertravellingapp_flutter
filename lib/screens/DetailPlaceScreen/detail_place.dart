// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters

import 'package:flutter/material.dart';

import '../../screens/navbar_screen.dart';
import 'images_slider.dart';
import 'detail_decover_place.dart';
import '../MapScreen/map_screen.dart';
import '../../model/place_model.dart';
import '../../provider/favourite_provider.dart';

class DetailPlace extends StatefulWidget {
  final Place place;
  const DetailPlace({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel Section
            Stack(
              children: [
                SizedBox(
                  height: 350,
                  child: ImagesSlider(
                    image: widget.place.image,
                    onChange: (index) {
                      setState(() {
                        currentImage = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  right: 10,
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
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  // Toggle the favorite status of the place
                                  provider.toggleFavorite(widget.place);

                                  // Show a SnackBar with a message
                                  final snackBar = SnackBar(
                                    content: Text(
                                      provider.isExist(widget.place)
                                          ? '${widget.place.title} was added to favorites!'
                                          : '${widget.place.title} was removed from favorites!',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    duration: Duration(seconds: 2),
                                    backgroundColor:
                                        provider.isExist(widget.place)
                                            ? Colors.green
                                            : Colors.red,
                                  );

                                  // Use ScaffoldMessenger to show the SnackBar
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Icon(
                                  provider.isExist(widget.place)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        width: 18,
                        height: 8,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentImage == index
                              ? Colors.black
                              : Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            // const SizedBox(height: 10),

            // Details Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and Location Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.place.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  widget.place.location,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      )),
                            ),
                            Text(
                              '${widget.place.rate}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Overview Section
                    Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Divider(color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      widget.place.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Information Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '5 Days\n Duration',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          color: Colors.black,
                        ),
                        Text(
                          '500 Km\n Distance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          color: Colors.black,
                        ),
                        Text(
                          '17 C\n Cloudy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Buttons

                    SizedBox(height: 20),
                    // Discover Place Section
                    DetailDecoverPlace(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        height: 65,
        decoration: BoxDecoration(
            color: Colors.blue[400], borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapScreen()),
              );
            },
            child: Center(
              child: Text(
                'Show On Map',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )),
      ),
    );
  }
}
