import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reportio/pages/Landing.dart';
import 'package:reportio/pages/login.dart';

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
            return LoginPage();
          }
        },
      ),
    );
  }
}
