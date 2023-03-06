import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key});

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
                          'Traffic Update 🚦',
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
                          child: Text(
                              'Traffic congestion along Jakaya Kikwete Road ',
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
                        Column(
                          children: [
                            Text(
                              'Verified',
                              style: GoogleFonts.rubik(
                                color: (const Color.fromRGBO(86, 163, 49, 1)),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '11:30 6th March 2023',
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
