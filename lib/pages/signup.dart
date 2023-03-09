// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/custom_textfield.dart';
import '../components/tile.dart';
import '../components/auth_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  var db = FirebaseFirestore.instance;
  var fb = FirebaseAuth.instance;

  bool validation = false;

  // List of locations (will be included in DB)
  var locationsList = [];

// register new user
  void signUpFunc() async {
    // checking that all fields have data
    setState(
      () {
        emailController.text.isEmpty |
                nameController.text.isEmpty |
                confirmPasswordController.text.isEmpty |
                confirmPasswordController.text.isEmpty |
                phoneController.text.isEmpty
            ? validation = false
            : validation = true;
      },
    );

    if (validation) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });

// try catch block to handle signup
      try {
        // check if the confirm password and actual password is the same
        if (confirmPasswordController.text == passwordController.text) {
          await fb.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          try {
            var user = <String, dynamic>{
              'Name': nameController.text,
              'Email': fb.currentUser?.email,
              'Phone Number': phoneController.text,
              'Location': locationController.text,
              'deletionMarker': false,
            };

            // adds the user to the database and creates the 1st message for them, this message is not sent to the SMS service as it should be unverified
            db.collection('whistleblowers').add(user);
          } on FirebaseException catch (e) {
            debugPrint('Code: ${e.code}/n Message:${e.message}');
          }
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          displayAlert('Passwords do not match');
        }
      } on FirebaseAuthException catch (e) {
// stops the spinning loader
        Navigator.pop(context);
        // handles wrong email
        if (e.code == 'user-not-found') {
          displayAlert('Please check your email and try again');
        }
        // handles wrong password
        else if (e.code == 'wrong-password') {
          displayAlert('You have entered the wrong password');
        } else {
          displayAlert(e.message as String);
        }
      }
    } else {
      // Navigator.pop(context);
      displayAlert('Make sure all fields are filled!');
    }
  }

  // handle login issues
  void displayAlert(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: GoogleFonts.rubik(),
            ),
            backgroundColor: Color.fromARGB(189, 244, 67, 54),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 100,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Create a new account',
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                        color: Color.fromRGBO(167, 221, 128, 1),
                      ),
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: nameController,
                      hint: 'Name',
                      hide: false,
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: emailController,
                      hint: 'Email',
                      hide: false,
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: phoneController,
                      hint: 'Phone Number',
                      hide: false,
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: locationController,
                      hint: 'Primary Location',
                      hide: false,
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: passwordController,
                      hint: 'Password',
                      hide: true,
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: confirmPasswordController,
                      hint: 'Confirm Password',
                      hide: true,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      onTap: signUpFunc,
                      text: 'Register',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Or continue with',
                              style: GoogleFonts.rubik(
                                  color: Colors.grey.shade700),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Tile(imagePath: 'assets/images/google.png'),
                        SizedBox(
                          width: 50,
                        ),
                        Tile(imagePath: 'assets/images/apple.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: GoogleFonts.rubik(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Login here',
                            style: GoogleFonts.rubik(
                                color: Color.fromRGBO(
                                  167,
                                  221,
                                  128,
                                  1,
                                ),
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
