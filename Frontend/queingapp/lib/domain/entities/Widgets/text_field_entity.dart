import 'package:flutter/material.dart';

class TextFieldEntity {
  final FormFieldValidator? validator;
  final Widget? suffixIcon;
  final Widget? icon;
  final bool? isObscure;
  final String? hintText;
  final TextEditingController controller;

  const TextFieldEntity({
    this.validator,
    this.icon,
    this.isObscure,
    this.suffixIcon,
    this.hintText,
    required this.controller,
  });

  
}