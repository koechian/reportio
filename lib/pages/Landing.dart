import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  Landing({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void logUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: logUserOut,
          icon: const Icon(Icons.logout),
        ),
      ]),
      body: Center(
        child: Text('Logged in as ${user.email!}'),
      ),
    );
  }
}
