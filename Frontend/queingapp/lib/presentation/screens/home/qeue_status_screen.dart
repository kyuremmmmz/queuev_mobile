import 'package:flutter/material.dart';

class QueueStatusScreen extends StatelessWidget {
  const QueueStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'QUEUE STATUS',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'YOU ARE',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              alignment: Alignment.center,
              child: const Text(
                '13',
                style: TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'IN THE ENROLLMENT\nQUEUE',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40.0),
            _buildInfoRow('QUEUE NAME:', 'SOUTHERN LUZON STATE UNIVER...'),
            _buildInfoRow('ADDRESS:', 'BRGY SAN ANTONIO, PALA, CATAN...'),
            _buildInfoRow('CURRENT NO.', '---'),
            _buildInfoRow('SCHEDULE:', '8:00 AM / July 2, 2025'),
            _buildInfoRow('ESTIMATED TIME:', '9:00 AM'),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, color: Colors.black, size: 20),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Please note that each person has a 5-minute window to be accommodated. We recommend arriving at least 10 minutes early, thank you.',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 120, // Fixed width for the label
            height: 40,
            color: Colors.black,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                value,
                style: const TextStyle(color: Colors.black, fontSize: 14.0),
                overflow: TextOverflow.ellipsis, // Handle long text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
