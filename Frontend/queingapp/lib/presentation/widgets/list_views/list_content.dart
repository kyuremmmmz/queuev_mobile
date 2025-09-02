import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListContent extends StatelessWidget {
  final String number;
  final String title;
  final String type;
  final String date;
  const ListContent({
    super.key,
    required this.number,
    required this.title,
    required this.type,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Text(
            number,
            style: GoogleFonts.dmSans(
              fontSize: 44,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.dmSans(),
                ),
                Text(
                  type,
                  style: GoogleFonts.dmSans(),
                ),
                Text(
                  date,
                  style: GoogleFonts.dmSans(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}