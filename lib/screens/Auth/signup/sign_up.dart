// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../signin/signin.dart';
import '../../../screens/navbar_screen.dart';

class SIGNUP extends StatefulWidget {
  const SIGNUP({super.key});

  @override
  State<SIGNUP> createState() => _SIGNUPState();
}

class _SIGNUPState extends State<SIGNUP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.visafirst.com/blog/wp-content/uploads/2021/06/Cambodia-landscape.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Form(
                          // key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              //name
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: null,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(4, 4),
                                        )
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person_outlined),
                                        // suffixIcon: Icon(Icons.check),
                                        hintText: "example",
                                        // labelText: 'Email',
                                        // border: InputBorder.none,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter an email';
                                      //   }
                                      //   // Add more email validation logic here (optional)
                                      //   return null;
                                      // },
                                      // onChanged: (value) {
                                      //   setState(() {
                                      //     _email = value;
                                      //   });
                                      // },
                                    ),
                                  )
                                ],
                              ),
                              //
                              //email
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: null,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(4, 4),
                                        )
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email_outlined),
                                        // suffixIcon: Icon(Icons.check),
                                        hintText: "example@gmail.com",
                                        // labelText: 'Email',
                                        // border: InputBorder.none,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter an email';
                                      //   }
                                      //   // Add more email validation logic here (optional)
                                      //   return null;
                                      // },
                                      // onChanged: (value) {
                                      //   setState(() {
                                      //     _email = value;
                                      //   });
                                      // },
                                    ),
                                  )
                                ],
                              ),
                              //
                              //Password
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Password',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: null,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(4, 4),
                                        )
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outlined),
                                        // suffixIcon: Icon(Icons.check),
                                        hintText: "123456789",
                                        // labelText: 'Email',
                                        // border: InputBorder.none,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter an email';
                                      //   }
                                      //   // Add more email validation logic here (optional)
                                      //   return null;
                                      // },
                                      // onChanged: (value) {
                                      //   setState(() {
                                      //     _email = value;
                                      //   });
                                      // },
                                    ),
                                  ),
                                ],
                              ),
                              //
                              //Comfirm Password
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Comfirm Password',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: null,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(4, 4),
                                        )
                                      ],
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outlined),
                                        // suffixIcon: Icon(Icons.check),
                                        hintText: "123456789",
                                        // labelText: 'Email',
                                        // border: InputBorder.none,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter an email';
                                      //   }
                                      //   // Add more email validation logic here (optional)
                                      //   return null;
                                      // },
                                      // onChanged: (value) {
                                      //   setState(() {
                                      //     _email = value;
                                      //   });
                                      // },
                                    ),
                                  )
                                ],
                              ),
                              //
                              //Button
                              const SizedBox(height: 24.0),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 100, right: 100, top: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.blue, // Background color
                                    foregroundColor: Colors.white, // Text color
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    // if (_formKey.currentState!.validate()) {
                                    //   // Process sign-up logic here (e.g., send data to server)
                                    //   print('Email: $_email');
                                    //   print('Password: $_password');
                                    //   // Clear the form after successful sign-up
                                    //   _formKey.currentState!.reset();
                                    // }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ButtomNavBar()));
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Have an account?',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.transparent, // No background
                                      shadowColor:
                                          Colors.transparent, // No shadow
                                      elevation: 0, // No elevation
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius
                                            .zero, // Optional: Set border radius
                                        side: BorderSide.none, // No border
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
