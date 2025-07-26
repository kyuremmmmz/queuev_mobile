import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableContainerWidget extends StatelessWidget {
  const ReusableContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SOUTHERN LUZON STATE UNIVERSITY - CATANUAN EXTENSION",
          style:GoogleFonts.dmSans(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ) ,),
          Text("BRGY SAN ANTONIO, PALA, CATANUAN, QUEZON",
          style:GoogleFonts.dmSans(
            fontSize: 9,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ) ,)
        ],
      ),
    );
  }
}