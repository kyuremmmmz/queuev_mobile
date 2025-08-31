import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListContent extends StatelessWidget {
  final String number;
  final String title;
  final String type;
  final String date;
  const ListContent({super.key, required this.number, required this.title, required this.type, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: Text(number,
          style: GoogleFonts.dmSans(
            fontSize: 21,
            color: Colors.white,
            fontWeight: FontWeight.w700
          ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black
              ),
              top: BorderSide(
                color: Colors.black
              ),
              left: BorderSide(
                color: Colors.black
              ),
              right: BorderSide(
                color: Colors.black
              ),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.dmSans(
              ),
              ),

            ],
          ),
        )
      ],
    );
  }
}