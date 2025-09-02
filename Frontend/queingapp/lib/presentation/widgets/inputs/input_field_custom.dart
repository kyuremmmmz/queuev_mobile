// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFieldCustom extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType type;
  final FormFieldValidator? validator;
  const InputFieldCustom({
    super.key,
    required this.label,
    required this.controller,
    required this.type,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          color: Colors.black,
          padding: EdgeInsets.only(left: 10, right: 0, top: 20, bottom: 20),
          child: Text(label,
          style: GoogleFonts.dmSans(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
        ),
        Expanded(
          child: TextFormField(
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(
                  color: Colors.black
                )
              )
            ),
          ),
        )
      ],
    );
  }
}
