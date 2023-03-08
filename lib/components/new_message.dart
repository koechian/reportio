import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reportio/components/auth_button.dart';
import 'package:reportio/components/custom_textfield.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final typeController = TextEditingController();
  final locationController = TextEditingController();
  final contentController = TextEditingController();
  bool validation = false;

  // database variables
  var db = FirebaseFirestore.instance;
  var fb = FirebaseAuth.instance;

  void sendBroadcast() {
    // checking that all fields have data
    setState(() {
      locationController.text.isEmpty |
              contentController.text.isEmpty |
              typeController.text.isEmpty
          ? validation = false
          : validation = true;
    });
    if (validation) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });

// try catch block to handle message addition
      try {
        var message = {
          'Poster Email': fb.currentUser?.email,
          'Message Content': contentController.text,
          'Message Type': typeController.text,
          'Date Posted': Timestamp.now(),
          'Refrenced Location': locationController.text,
          'isVerified': false
        };

        db.collection('messages').add(message);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
// stops the spinning loader
        Navigator.pop(context);
        displayAlert(e.message.toString());
      }
      Navigator.pop(context);
    } else {
      displayAlert('Please fill all the fields');
    }
  }

  // display alerts
  void displaySuccess(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: GoogleFonts.rubik(),
            ),
            backgroundColor: const Color.fromARGB(188, 62, 62, 62),
          );
        });
  }

  // display alerts
  void displayAlert(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: GoogleFonts.rubik(),
            ),
            backgroundColor: const Color.fromARGB(189, 244, 67, 54),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // Location Dorpdown Initial Items

    return Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(18, 18, 18, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Broadcast New Alert',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(fontSize: 18, color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                MyTextField(
                    controller: typeController,
                    hint: 'Alert Type',
                    hide: false),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                    controller: locationController,
                    hint: 'Location',
                    hide: false),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  controller: contentController,
                  hint: 'Compose Alert',
                  hide: false,
                  bordercolor: const Color.fromARGB(0, 0, 0, 0),
                  focusedbordercolor: const Color.fromARGB(0, 0, 0, 0),
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  onTap: sendBroadcast,
                  text: 'Send Broadcast',
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ]),
        ));
  }
}
