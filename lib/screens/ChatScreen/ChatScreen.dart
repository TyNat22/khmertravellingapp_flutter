// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          height: 90,
          decoration: BoxDecoration(
            color: Colors.blue[400],
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Message',
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    )));
  }
}
