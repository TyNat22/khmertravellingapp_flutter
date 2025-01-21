// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import '../Auth/signin/signin.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Intro_page.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 450),
                        child: Text(
                          'A NEW WAY \n TO TRAVEL',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'we maximize your vacations \n experiments the right way ',
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    //
                    EXPLOREBTN(),
                    //
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class EXPLOREBTN extends StatefulWidget {
  const EXPLOREBTN({super.key});

  @override
  State<EXPLOREBTN> createState() => _EXPLOREBTNState();
}

class _EXPLOREBTNState extends State<EXPLOREBTN> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(156, 3, 243, 243),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          },
          child: Text(
            "Explore Now!",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
