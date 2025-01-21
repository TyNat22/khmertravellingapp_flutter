// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_literals_to_create_immutables, duplicate_import, unused_import

// import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:network_state_management/screens/DetailPlaceScreen/detail_place.dart';

import '../TopDestinationScreen/top_destination.dart';
import '../../model/place_model.dart';
//TOPDESTINATION

import 'package:flutter/material.dart';

class Topdestination extends StatelessWidget {
  const Topdestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Top Destination',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopDestinationScreen(),
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: topdestination.map((place) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Action when the item is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPlace(
                            place: place,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 190,
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green,
                        image: DecorationImage(
                          image: AssetImage(place.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                place.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 10),
                              child: Text(
                                place.location,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// class ItemDetailsScreen extends StatelessWidget {
//   final Item item;

//   const ItemDetailsScreen({Key? key, required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(item.name)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(item.imageUrl, height: 200, fit: BoxFit.cover),
//             SizedBox(height: 20),
//             Text(
//               item.name,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               item.location,
//               style: TextStyle(fontSize: 18, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
