// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/domain/entities/queues/notification_entity.dart';

class NotificationDto {
  final String notification_type;
  final String description;
  final String notification_id;
  final String uid;
  final String category_id;
  final String category_name;
  final Timestamp timestamp;
  NotificationDto({
    required this.notification_type,
    required this.description,
    required this.notification_id,
    required this.category_id,
    required this.uid,
    required this.category_name,
    required this.timestamp,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'notification_type': notification_type,
      'description': description,
      'uid': uid,
      'notification_id': notification_id,
      'category_id': category_id,
      'category_name': category_name,
      'timestamp': timestamp,
    };
  }

  factory NotificationDto.fromMap(
    DocumentSnapshot<Map<String, dynamic>> map,
    SnapshotOptions? options,
  ) {
    return NotificationDto(
      notification_type: map['notification_type'].toString(),
      uid: map['uid'].toString(),
      description: map['description'].toString(),
      notification_id: map['notification_id'].toString(),
      category_id: map['category_id'].toString(),
      category_name: map['category_name'].toString(),
      timestamp: map['timestamp'],
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(notification_type, description, notification_id, category_id, category_name, timestamp, uid);
  }

  static NotificationDto fromEntity(NotificationEntity entity) {
    return NotificationDto(
      notification_type: entity.notification_type,
      uid: entity.uid,
      description: entity.description,
      notification_id: entity.notification_id,
      category_id: entity.category_id,
      category_name: entity.category_name,
      timestamp: entity.timestamp,
    );
  }
}
