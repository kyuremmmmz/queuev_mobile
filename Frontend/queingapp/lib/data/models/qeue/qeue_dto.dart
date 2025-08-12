import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/domain/entities/queues/queues_entity.dart';

class QeueDto {
  final String name;
  final String type;
  final int index;
  final Timestamp? schedule;
  final Timestamp? timein;
  final String address;
  final String? status;
  final String? uid;

  QeueDto({
    this.uid,
    required this.name,
    required this.status,
    required this.type,
    required this.index,
    this.schedule,
    this.timein,
    required this.address,
  });

  factory QeueDto.fromJson(
    DocumentSnapshot<Map<String, dynamic>> json,
    SnapshotOptions? snapshot,
  ) {
    final data = json.data();
    return QeueDto(
      uid: data?['uid'] ?? '',
      status: data?['status'] ?? '',
      name: data?['name'] ?? '',
      type: data?['type'] ?? '',
      index: data?['index'] ?? 0,
      schedule: data?['schedule'] ?? '',
      timein: data?['time_in'] ?? '',
      address: data?['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'index': index,
      'schedule': schedule,
      'time_in': timein,
      'address': address,
      'status': status,
      'uid': uid,
    };
  }

  QueuesEntity toEntity() {
    return QueuesEntity(
      uid: uid,
      status: status,
      name: name,
      type: type,
      index: index,
      schedule: schedule,
      timein: timein,
      address: address,
    );
  }

  static QeueDto fromEntity(QueuesEntity entity) {
    return QeueDto(
      uid: entity.uid,
      status: entity.status,
      name: entity.name,
      type: entity.type,
      index: entity.index,
      schedule: entity.schedule,
      timein: entity.timein,
      address: entity.address,
    );
  }
}
