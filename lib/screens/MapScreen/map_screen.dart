// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'PlaceLocation',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/map.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  style: TextStyle(
                    color: Colors.blue, // Text color
                    fontSize: 16, // Text size
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Enter your text',
                    hintText: 'Type something...',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.blue,
                        )),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2),
                  spreadRadius: 2,
                  blurRadius: 2)
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Beautiful In White',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        height: 55,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.blue[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                'Get Directions',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        height: 55,
                        width: 90,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 217, 226, 237),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_box_sharp,
                                size: 30,
                                color: Colors.blue,
                              ),
                              Text(
                                'start',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        height: 55,
                        width: 90,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 217, 226, 237),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                size: 30,
                                color: Colors.blue,
                              ),
                              Text(
                                'Call',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
