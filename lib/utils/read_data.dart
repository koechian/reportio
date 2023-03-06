import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reportio/components/message_container.dart';

class GetMessages extends StatelessWidget {
  const GetMessages({super.key, required this.docid});

  final String docid;

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');
    return FutureBuilder<DocumentSnapshot>(
      future: messages.doc(docid).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return MessageContainer(
            messageType: data['Message Type'],
            isVerified: data['isVerified'],
            messageContent: data['Message Content'],
            date: DateTime.fromMicrosecondsSinceEpoch(
                data['Date Posted'].microsecondsSinceEpoch),
          );
        }
        return Container(
          width: 30,
          child: CircularProgressIndicator.adaptive(),
        );
      }),
    );
  }
}
