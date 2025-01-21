// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none, // To prevent clipping of the badge
        children: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Your action here
            },
          ),
          Positioned(
            right: 0, // Position the badge to the right of the icon
            top: 0, // Position the badge at the top of the icon
            child: Container(
              padding: EdgeInsets.all(6), // Adjust the padding for the badge
              decoration: BoxDecoration(
                color: Colors.red, // Badge color
                shape: BoxShape.circle, // Make it circular
              ),
              constraints: BoxConstraints(
                minWidth: 18, // Minimum width of the badge
                minHeight: 18, // Minimum height of the badge
              ),
              child: Center(
                child: Text(
                  '3', // Badge number or content
                  style: TextStyle(
                    color: Colors.white, // Badge text color
                    fontSize: 12, // Font size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
