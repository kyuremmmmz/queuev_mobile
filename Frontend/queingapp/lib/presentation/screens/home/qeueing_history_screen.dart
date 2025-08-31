import 'package:flutter/material.dart';
import 'package:queingapp/presentation/widgets/list_views/list_content.dart';

class QeueingHistoryScreen extends StatefulWidget {
  const QeueingHistoryScreen({super.key});

  @override
  State<QeueingHistoryScreen> createState() => _QeueingHistoryScreenState();
}

class _QeueingHistoryScreenState extends State<QeueingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListContent(number: '13', title: 'SOUTHERN LUZON STATE UNIVERSITY - CATANUAN EXT...', type: 'ENROLLMENT', date: 'July 2, 2025')
          ],
        ),
      ),
    );
  }
}