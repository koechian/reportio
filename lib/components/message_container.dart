import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MessageContainer extends StatelessWidget {
  MessageContainer(
      {super.key,
      required this.messageContent,
      required this.date,
      required this.messageType,
      required this.isVerified});

  final String messageType;
  final String messageContent;
  final bool isVerified;
  final DateTime date;

  String status = 'Unverified';

  Widget statusBool() {
    if (isVerified) {
      return Text(
        'Verified',
        style: GoogleFonts.rubik(
          color: (const Color.fromRGBO(86, 163, 49, 1)),
        ),
      );
    } else {
      return Text(
        'Unverified',
        style: GoogleFonts.rubik(
          color: (const Color.fromRGBO(243, 120, 104, 1)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 1,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(18, 18, 18, 1),
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 4),
          ),
        ),
        height: 105,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 6),
                    child: Icon(
                      Icons.circle,
                      color: Color.fromRGBO(62, 141, 54, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          messageType,
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 19),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(messageContent,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              maxLines: 1,
                              style: GoogleFonts.rubik(color: Colors.white)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(children: [statusBool()]),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${DateFormat.Hm('en_US').format(date)}, ${DateFormat.MMMMEEEEd('en_US').format(date)}',
                                  style: GoogleFonts.rubik(
                                    color: (const Color.fromARGB(
                                        255, 175, 175, 175)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
