import 'package:flutter/material.dart';

class QeueingScreenPageView extends StatefulWidget {
  const QeueingScreenPageView({super.key});

  @override
  State<QeueingScreenPageView> createState() => _QeueingScreenPageViewState();
}

class _QeueingScreenPageViewState extends State<QeueingScreenPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        QeueingScreenPageView(),

      ],
    );
  }
}