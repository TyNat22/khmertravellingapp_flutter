import 'package:flutter/material.dart';

class HeartClickBtn extends StatefulWidget {
  const HeartClickBtn({super.key});

  @override
  State<HeartClickBtn> createState() => _HeartClickBtnState();
}

class _HeartClickBtnState extends State<HeartClickBtn> {
  bool _isStarred = false; // Tracks the toggle state
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isStarred
            ? Icons.favorite
            : Icons.favorite_border, // Filled or outlined star
        color:
            _isStarred ? Colors.blue : const Color.fromARGB(255, 255, 255, 255),
        size: 25.0,
      ),
      onPressed: () {
        setState(() {
          _isStarred = !_isStarred; // Toggle the star state
        });
      },
    );
  }
}
