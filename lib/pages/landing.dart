import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reportio/utils/read_data.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // VARIABLES
  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;
  int _selectedIndex = 0;
  List<String> ids = [];

// METHODS

// Logout
  void logUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future getMessages() async {
    ids.clear();
    await db
        .collection('messages')
        .where('Poster Email', isEqualTo: user.email)
        .orderBy('Date Posted', descending: true)
        .get()
        .then(
          (value) => value.docs.forEach((element) {
            ids.add(element.reference.id);
          }),
        );
  }

// Change index for bottom navbar navigation
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  late final List<Widget> _widgetOptions = <Widget>[
    Expanded(
      child: ListView(
        children: <Widget>[
          FutureBuilder(
            future: getMessages(),
            builder: (context, snapshot) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: ids.length,
                  itemBuilder: (context, index) {
                    return GetMessages(docid: ids[index]);
                  });
            },
          ),
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

// MAIN BUILD METHOD
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
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
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
