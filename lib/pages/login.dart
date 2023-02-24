// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../components/MyTextField.dart';
import '../components/MyButton.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInFunc() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(children: [
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
                children: const [Text('Forgot Password?')],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              onTap: signInFunc,
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
            Row(
              children: [
                Image.asset(
                  'lib/images/google.png',
                  height: 72,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
