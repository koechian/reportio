// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/custom_textfield.dart';
import '../components/tile.dart';
import '../components/auth_button.dart';
import '../pages/password_reset.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// sign in user
  void signInFunc() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

// try catch block to handle auth
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
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
  }

  // handle login issues
  void displayAlert(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            backgroundColor: Colors.red,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Welcome to Reportio',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: emailController,
                      hint: 'Email',
                      hide: false,
                    ),
                    const SizedBox(height: 25),
                    MyTextField(
                      controller: passwordController,
                      hint: 'Password',
                      hide: true,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PasswordResetPage();
                                  },
                                ),
                              );
                            },
                            child: Text('Forgot Password?'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      onTap: signInFunc,
                      text: 'Sign In',
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
                              style: TextStyle(color: Colors.grey.shade700),
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
                        Text('Not a whistleblower?'),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            'Signup now',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold),
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
