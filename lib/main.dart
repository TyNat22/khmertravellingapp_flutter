// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/favourite_provider.dart';
import './screens/LockScreen/lock_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          // for favorite
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LockScreen(),
        ),
  );
}
