import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reportio/pages/landing.dart';
import 'package:reportio/pages/switcher.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // is the user logged in or not
          if (snapshot.hasData) {
            return const Landing();
          } else {
            return const Switcher();
          }
        },
      ),
    );
  }
}
