import 'package:flutter/material.dart';

class ReusableContainerWidget extends StatelessWidget {
  const ReusableContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text("SOUTHERN LUZON STATE UNIVERSITY - CATANUAN EXTENSION",
          style: ,)
        ],
      ),
    );
  }
}