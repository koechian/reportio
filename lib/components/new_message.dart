import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    // Location Dorpdown Initial Items
    var db = FirebaseFirestore.instance;

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
                  onTap: () {},
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
