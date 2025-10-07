import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableContainerWidget extends StatelessWidget {
  final String name;
  final String address;
  const ReusableContainerWidget({super.key, required this.name, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
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
          Text(name,
          style:GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ) ,),
          Text(address,
          style:GoogleFonts.dmSans(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ) ,)
        ],
      ),
    );
  }
}