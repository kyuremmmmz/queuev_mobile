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
                  .where('uid', isEqualTo: '${USER.currentUser?.uid}')
                  .orderBy('timestamp', descending: true)
                  .withConverter(
                    fromFirestore: NotificationDto.fromMap,
                    toFirestore: (NotificationDto dto, _) => dto.toMap(),
                  )
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No notifications yet"));
                }

                final notifications = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final doc = notifications[index];
                    final notif = doc.data() as NotificationDto;

                    IconData icon;
                    if (notif.notification_type == "queue_status") {
                      icon = Icons.hourglass_bottom;
                    } else if (notif.notification_type == "reminder") {
                      icon = Icons.notifications_active_outlined;
                    } else {
                      icon = Icons.check_circle_outline;
                    }

                    return Dismissible(
                      key: Key(doc.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      confirmDismiss: (direction) async {
                        // Optional confirmation dialog
                        return await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Delete Notification"),
                            content: const Text(
                                "Are you sure you want to delete this notification?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: const Text("Delete"),
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (direction) async {
                        await DB.collection('notifications').doc(doc.id).delete();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Notification deleted')),
                        );
                      },
                      child: ListTile(
                        leading: Icon(icon, size: 30),
                        title: Text(
                          notif.description,
                          style: GoogleFonts.dmSans(fontSize: 14),
                        ),
                        subtitle: Text(
                          DateFormat("h:mm a - MMM d, yyyy (EEEE)")
                              .format(notif.timestamp.toDate()),
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        isThreeLine: true,
                      ),
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
