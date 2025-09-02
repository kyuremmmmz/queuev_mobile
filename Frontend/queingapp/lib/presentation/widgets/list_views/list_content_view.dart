// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListContentView extends StatelessWidget {
  final String label;
  final VoidCallback callback;
  final IconData icon;
  final double width;
  final double height;
  const ListContentView({
    super.key,
    required this.label,
    required this.callback,
    required this.icon, 
    required this.width, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          color: Colors.black,
          child: Icon(icon, color: Colors.white,),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Text(label),
          ),
        )
      ],
    ),
    );
  }
}
