// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NATWORKLAYOUT extends StatefulWidget {
  const NATWORKLAYOUT({super.key});

  @override
  State<NATWORKLAYOUT> createState() => _NATWORKLAYOUTState();
}

class _NATWORKLAYOUTState extends State<NATWORKLAYOUT> {
  bool isStarred = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    // labelText: 'Search ...',
                    hintText: 'Search ...',
                    fillColor: Colors.grey[300],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.blue[400],
                      size: 30,
                    ),
                    suffixIcon: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      color: Colors.blue[400],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 250,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/6/66/Polar_Bear_-_Alaska_%28cropped%29.jpg',
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(
                                      8.0), // Spacing for the star icon
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.all(0),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isStarred =
                                                    !isStarred; // Toggle state
                                              });
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              size: 35,
                                              color: isStarred
                                                  ? Colors.blue
                                                  : Colors.white,
                                            )),
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Polar Bear',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
