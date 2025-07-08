import 'package:flutter/material.dart';

class TabBarComponent extends StatelessWidget {
  final Widget screen;
  const TabBarComponent({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: screen
    );
  }
}