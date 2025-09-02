// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListContentEntity {
  final String label;
  final VoidCallback callback;
  final IconData icon;
  final double width;
  final double height;
  ListContentEntity({
    required this.label,
    required this.callback,
    required this.icon,
    required this.width,
    required this.height,
  });
}
