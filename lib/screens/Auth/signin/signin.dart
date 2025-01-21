// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, duplicate_import

import 'package:flutter/material.dart';
import '../../../screens/navbar_screen.dart';
import '../signup/sign_up.dart';

import '../../../model/user_model.dart';
import '../../navbar_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final _emailController =
      TextEditingController(); // Controller for email field
  final _passwordController =
      TextEditingController(); // Controller for password field
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Get the entered email and password
      String email = _emailController.text;
      String password = _passwordController.text;

      // Check if the user exists in the list
      User? loggedInUser;
      for (var user in user) {
        if (user.email == email && user.password == password) {
          loggedInUser = user;
          break;
        }
      }

      // Show a message based on the result
      if (loggedInUser != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );

        // Navigate to the HomePage after a short delay
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ButtomNavBar(),
            ),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
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
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
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
                                      controller: _emailController,
                                      validator: _validateEmail,
                                      keyboardType: TextInputType.emailAddress,
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
                                      controller: _passwordController,
                                      validator: _validatePassword,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outlined),
                                        // suffixIcon: Icon(Icons.check),
                                        hintText: "12345678",
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
                                  //ButtonSignIn
                                  Padding(
                                    padding: EdgeInsets.only(top: 50),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.blue, // Background color
                                        foregroundColor:
                                            Colors.white, // Text color
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 32),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: _submitForm,
                                      // onPressed: () {
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ButtomNavBar()),
                                      //   );
                                      // },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ),
                                  //text
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text("Dont have an account?"),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 0),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SIGNUP()));
                                          },
                                          child: Text(
                                            'Sign up',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.blue,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //Or sign In with
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 1,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Or Sign In With'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 120,
                                          height: 1,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Row Icon
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: 150,
                                          height: 50,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Your onPressed logic here
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 12.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image.asset(
                                                  'images/google.png', // Ensure the image path is correct
                                                  width: 24.0,
                                                  height: 24.0,
                                                ),
                                                SizedBox(width: 15.0),
                                                Text('Google'),
                                              ],
                                            ),
                                          )),
                                      //sixe
                                      SizedBox(width: 40),
                                      SizedBox(
                                        width: 150,
                                        height: 50,
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            print("Button Pressed");
                                          },
                                          icon: Icon(Icons.facebook_outlined,
                                              size: 30,
                                              color: Colors
                                                  .white), // Icon with color
                                          label: Text(
                                            "Facebook",
                                            style: TextStyle(
                                                color:
                                                    Colors.white), // Text color
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.blue, // Background color
                                            foregroundColor:
                                                Colors.white, // Text color
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 12), // Padding
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      8), // Rounded corners
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              //
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
