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
  final String categoryId;
  final String? catId;

  QeueDto({
    this.uid,
    required this.catId,
    required this.name,
    required this.status,
    required this.type,
    required this.index,
    required this.categoryId,
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
      categoryId: data?['categoryId'] ?? '',
      catId: data?['catId'] ?? '',
      uid: data?['uid'] ?? '',
      status: data?['status'] ?? '',
      name: data?['name'] ?? '',
      type: data?['category'] ?? '',
      index: data?['index'] ?? 0,
      schedule: data?['schedule'] ?? '',
      timein: data?['time_in'] ?? '',

      address: data?['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': type,
      'catId': catId,
      'index': index,
      'schedule': schedule,
      'time_in': timein,
      'address': address,
      'status': status,
      'uid': uid,
      'categoryId': categoryId,
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
      catId: catId,
    );
  }

  static QeueDto fromEntity(QueuesEntity entity) {
    return QeueDto(
      categoryId: entity.documentReference!,
      uid: entity.uid,
      status: entity.status,
      name: entity.name,
      type: entity.type,
      index: entity.index,
      schedule: entity.schedule,
      timein: entity.timein,
      catId: entity.catId,
      address: entity.address,
    );
  }
}
