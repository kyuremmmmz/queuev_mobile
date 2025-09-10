import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/data/models/qeue/notification_dto.dart';
import 'package:queingapp/data/source/queue/queue_service.dart';
import 'package:queingapp/injection.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StorageProvider>(context);
    final service = sl<QueueService>();
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          SizedBox(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.brown),
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                'NOTIFICATIONS',
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Notifications List
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: DB
                  .collection('notifications')
                  .withConverter(
                    fromFirestore: NotificationDto.fromMap,
                    toFirestore: (NotificationDto dto, _) => dto.toMap(),
                  )
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No notifications yet"));
                }

                final notifications = snapshot.data!.docs
                    .map((doc) => doc.data() as NotificationDto)
                    .toList();

                return ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notif = notifications[index];

                    IconData icon;
                    if (notif.notification_type == "queue_status") {
                      icon = Icons.hourglass_bottom;
                    } else if (notif.notification_type == "reminder") {
                      icon = Icons.notifications_active_outlined;
                    } else {
                      icon = Icons.check_circle_outline;
                    }

                    return ListTile(
                      leading: Icon(icon, size: 30),
                      title: Text(
                        notif.description,
                        style: GoogleFonts.dmSans(fontSize: 14),
                      ),
                      subtitle: Text(
                        DateFormat(
                          "h:mm a - MMM d, yyyy (EEEE)",
                        ).format(notif.timestamp.toDate()),
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      isThreeLine: true,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
