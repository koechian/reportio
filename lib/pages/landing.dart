import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final user = FirebaseAuth.instance.currentUser!;

  var db = FirebaseFirestore.instance;

  void logUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void getMessages() {
    var db = FirebaseFirestore.instance;
    try {
      db
          .collectionGroup('messages')
          .where('Poster Email',
              isEqualTo: FirebaseAuth.instance.currentUser?.email)
          .get()
          .then((snapshot) {
        for (var doc in snapshot.docs) {
          print('${doc.id} => ${doc.data()}');
        }
      }, onError: (e) => print(e));
    } on FirebaseException catch (e) {
      print(e.code);
    }
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
        child: GestureDetector(
          onTap: getMessages,
          child: Text('Logged in as ${user.email!}, tap to see messages}'),
        ),
      ),
    );
  }
}
