// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String birthdate;
  final String address;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.birthdate,
    required this.address,
  });
}

final List<User> user = [
  User(
    name: "Tay Mark",
    email: "example@gmail.com",
    password: "12345678",
    birthdate: '12/03/2000',
    address: 'Phnom Penh',
  ),
];
