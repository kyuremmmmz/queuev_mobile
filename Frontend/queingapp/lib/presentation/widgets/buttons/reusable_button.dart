import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final num width;
  final num height;
  const ReusableButton({super.key, required this.title, required this.onPressed, this.backgroundColor, this.textColor, required this.width, required this.height,  this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape:  RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fixedSize: Size(width.toDouble(), height.toDouble())
          ),
          onPressed: onPressed, 
          child: Text(title,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: textColor
            ),
          )
        );
  }
}