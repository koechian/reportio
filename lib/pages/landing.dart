import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reportio/components/auth_button.dart';
import 'package:reportio/components/message_container.dart';
import 'package:reportio/components/new_message.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // VARIABLES
  final user = FirebaseAuth.instance.currentUser!;
  final db = FirebaseFirestore.instance;

  late final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('old')
      .where('Poster Email', isEqualTo: user.email)
      .orderBy('Date Posted', descending: true)
      .snapshots();

  late final Stream<QuerySnapshot> _verificationStream = FirebaseFirestore
      .instance
      .collection('messages')
      .where('Poster Email', isNotEqualTo: user.email)
      .snapshots();

  int _selectedIndex = 0;
  List<String> ids = [];

// METHODS

  markVerified(docid) async {
    final docsRef = db.collection('messages').doc(docid);

    db.runTransaction((transaction) async {
      final snapshot = await transaction.get(docsRef);

      final newverificationStatus = !snapshot.get('isVerified');

      transaction.update(docsRef, {'isVerified': newverificationStatus});
    }).then((value) => debugPrint('Success'), onError: (e) => debugPrint(e));
  }

// Logout
  void logUserOut() {
    FirebaseAuth.instance.signOut();
  }

// Change index for bottom navbar navigation

  late final List<Widget> _widgetOptions = <Widget>[
    StreamBuilder<QuerySnapshot>(
        stream: _messageStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return Text(
              'Something went wrong, check the logs',
              style: GoogleFonts.rubik(color: Colors.white),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }
          if (snapshot.hasData) {
            debugPrint('Mambo ni live');
            return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return MessageContainer(
                          messageContent: data['Message Content'].toString(),
                          location: data['Referenced Location'].toString(),
                          date: DateTime.fromMicrosecondsSinceEpoch(
                              data['Date Posted'].microsecondsSinceEpoch),
                          messageType: data['Message Type'].toString(),
                          isVerified: data['isVerified']);
                    })
                    .toList()
                    .cast());
          } else {
            return const CircularProgressIndicator();
          }
        }),
    StreamBuilder<QuerySnapshot>(
        stream: _verificationStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          debugPrint(snapshot.hasData.toString());
          if (snapshot.hasError) {
            return const Text('something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }
          if (snapshot.hasData) {
            debugPrint(snapshot.data!.docs.toString());
            Fluttertoast.showToast(
                msg: 'Tap on the message to Verifiy it',
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 3,
                backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                textColor: const Color.fromRGBO(167, 221, 128, 1),
                fontSize: 16,
                gravity: ToastGravity.CENTER);
            return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          final docsRef =
                              db.collection('messages').doc(document.id);

                          db.runTransaction((transaction) async {
                            final snapshot = await transaction.get(docsRef);

                            final newverificationStatus =
                                !snapshot.get('isVerified');

                            transaction.update(
                                docsRef, {'isVerified': newverificationStatus});
                          }).then((value) => debugPrint('Success'),
                              onError: (e) => debugPrint(e));
                        },
                        child: MessageContainer(
                            location: data['Referenced Location'].toString(),
                            messageContent: data['Message Content'].toString(),
                            date: DateTime.fromMicrosecondsSinceEpoch(
                                data['Date Posted'].microsecondsSinceEpoch),
                            messageType: data['Message Type'].toString(),
                            isVerified: data['isVerified']),
                      );
                    })
                    .toList()
                    .cast());
          } else {
            return const Center(
              child: Text(
                  'There seems to be no created messages yet! Chech back later'),
            );
          }
        }),
    Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 40,
          child: Center(
            child: Text(
              'Logged in as: ${user.email!}',
              style: GoogleFonts.rubik(fontSize: 18, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: MyButton(
            onTap: logUserOut,
            text: 'Logout',
          ),
        )
      ],
    )
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
      // extendBody: true,
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
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.black,
          context: context,
          builder: (context) {
            return Wrap(
              children: const [NewMessage()],
            );
          },
        ),
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
