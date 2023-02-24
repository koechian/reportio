import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(children: const [
            SizedBox(height: 50),
            Icon(
              Icons.lock,
              size: 100,
            ),
            SizedBox(height: 50),
            Text(
              'Welcome to Reportio',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
