import 'package:flutter/material.dart';

class ReusableField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? icon;
  final bool? isObscure;
  final String? hintText;
  final TextEditingController controller;
  const ReusableField({super.key, this.validator, this.icon, this.isObscure, this.suffixIcon, this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure ?? false,
      decoration:InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: icon,
        hintText: hintText,
        focusColor: Colors.black,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(221, 158, 156, 156)
          )
        ),
        focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
        color: Colors.black,
            )
          ),
        ),
    );
  }

}