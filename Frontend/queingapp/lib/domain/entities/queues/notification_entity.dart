import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationEntity {
  final String notification_type;
  final String description;
  final String notification_id;
  final String category_id;
  final String category_name;
  final Timestamp timestamp;

  NotificationEntity(this.notification_type, this.description, this.notification_id, this.category_id, this.category_name, this.timestamp);
}