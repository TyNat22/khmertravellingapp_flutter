// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

import '../DetailPlaceScreen/detail_place.dart';
import './hearticon.dart';
import '../PopularPlaceScreen/pop_place.dart';
import '../../model/place_model.dart';
import '../../provider/favourite_provider.dart';

class PopularPlaceHome extends StatelessWidget {
  const PopularPlaceHome({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Popular Place',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PopularPlace()));
              },
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),

        // Cards
        GridView.builder(
          padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.70,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 10),
          itemCount: popularplace.length,
          itemBuilder: (context, index) {
            final place = popularplace[index];
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
                elevation: 2,
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
                        padding:
                            EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(place.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Toggle the favorite status of the place
                                      provider.toggleFavorite(place);

                                      // Show a SnackBar with a message
                                      final snackBar = SnackBar(
                                        content: Text(
                                          provider.isExist(place)
                                              ? '${place.title} was added to favorites!'
                                              : '${place.title} was removed from favorites!',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: provider.isExist(place)
                                            ? Colors.green
                                            : Colors.red,
                                      );

                                      // Use ScaffoldMessenger to show the SnackBar
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    child: Icon(
                                      provider.isExist(place)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
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
                              place.title,
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
                                  place.location,
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
                                    '${place.rate}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
