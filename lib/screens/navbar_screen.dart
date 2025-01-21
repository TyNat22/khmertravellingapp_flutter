// ignore_for_file: unused_field, prefer_const_constructors, unused_import, duplicate_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import './ProfileScreen/account.dart';
import '../screens/HomeScreen/home_screen.dart';
import './ChatScreen/ChatScreen.dart';
import './SearchScreen/search_screen.dart';
import './FavouriteScreen/favourite_place.dart';
import './ProfileScreen/account.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    ChatScreen(),
    Favorite(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
        // height: 80,
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue[400],
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.chat, 'Chat', 1),
              _buildNavItem(Icons.favorite_border_outlined, 'Favourite', 2),
              _buildNavItem(Icons.person_outlined, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: _currentIndex == index ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 30,
          color: _currentIndex == index ? Colors.blue[400] : Colors.white,
        ),
      ),
      label: label,
    );
  }
}
