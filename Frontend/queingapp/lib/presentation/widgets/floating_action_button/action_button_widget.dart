import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback callback;
  const ActionButtonWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 300.0,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 2.0),
        ),
        onPressed: callback, 
        label: const Text('Scan Now',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
  }
}