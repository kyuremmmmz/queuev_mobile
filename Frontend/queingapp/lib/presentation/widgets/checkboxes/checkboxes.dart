import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Checkboxes extends StatefulWidget {
  final bool? isChecked;
  final ValueChanged<bool?>? onChanged;
  const Checkboxes({super.key, required this.isChecked, this.onChanged});

  @override
  State<Checkboxes> createState() => _CheckboxesState();
}

class _CheckboxesState extends State<Checkboxes> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "I have agreed to the ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "terms and conditions.",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                decoration: TextDecoration.underline, 
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/terms');
                },
            ),
          ],
        ),
      ),
      value: widget.isChecked ?? false,
      onChanged: widget.onChanged,
    );
  }
}