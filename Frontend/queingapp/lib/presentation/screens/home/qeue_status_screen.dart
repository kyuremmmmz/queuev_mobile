import 'package:flutter/material.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/domain/entities/queues/queues_entity.dart';
import 'package:queingapp/injection.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';
import 'package:queingapp/presentation/provider/QueueProvider/queue_provider.dart';
import 'package:intl/intl.dart';

class QueueStatusScreen extends StatelessWidget {
  const QueueStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = sl<QueueProvider>();
    final provider2 = sl<QrViewProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            final canPop = Navigator.canPop(context);
            if (canPop) {
              Navigator.pop(context);
            }
            if (provider2.isScanned == true) {
              provider2.scannedToFalse();
              Navigator.pop(context);
            }
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
      body: StreamBuilder<QueuesEntity?>(
        stream: provider.queueStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading queue data'));
          }
          final queue = snapshot.data;
          if (queue == null) {
            return const Center(child: Text('No queue data available'));
          }
          final date = queue.schedule!.toDate();
          final schedule = DateFormat('hh:mm a / MM/dd/yyyy').format(date);
          final estimatedTime = DateFormat(
            'hh:mm a',
          ).format(date.add(const Duration(hours: 1)));
          return SingleChildScrollView(
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
                  child: Text(
                    queue.cat,
                    style: const TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'IN THE ${queue.type}\nQUEUE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40.0),
                _buildInfoRow(
                  'QUEUE NAME:',
                  USER.currentUser!.displayName!.length > 20
                      ? '${USER.currentUser?.displayName}...'
                      : queue.name,
                ),
                _buildInfoRow(
                  'ADDRESS:',
                  queue.address.length > 20
                      ? '${queue.address.substring(0, 17)}...'
                      : queue.address,
                ),
                _buildInfoRow(
                  'CURRENT NO.',
                  '${queue.index}',
                ), // This could be dynamic if you track the current serving number
                _buildInfoRow('SCHEDULE:', schedule),
                _buildInfoRow('ESTIMATED TIME:', estimatedTime),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Colors.black,
                      size: 20,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        queue.note,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
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
