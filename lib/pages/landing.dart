import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as developer;

import 'package:reportio/components/message_container.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final user = FirebaseAuth.instance.currentUser!;

  void logUserOut() {
    FirebaseAuth.instance.signOut();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static final List<Widget> _widgetOptions = <Widget>[
    Expanded(
      child: ListView(
        children: const <Widget>[
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
          SizedBox(
            height: 3,
          ),
          MessageContainer(),
        ],
      ),
    ),
    const Text(
      'Index 1: Community Posts',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'REPORTIO',
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w300,
            color: const Color.fromRGBO(167, 221, 128, 1),
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        elevation: 3,
        splashColor: Colors.green.shade600,
        label: Text(
          'Alert',
          style: GoogleFonts.rubik(
              color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromRGBO(167, 221, 128, 1),
        icon: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_comment_rounded,
              color: Colors.grey,
            ),
            label: ('My Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.groups_2,
                color: Colors.grey,
              ),
              label: 'Community'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              label: 'Profile')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(167, 221, 128, 1),
        selectedFontSize: 14,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
