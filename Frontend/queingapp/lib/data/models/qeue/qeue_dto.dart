import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/domain/entities/queues/queues_entity.dart';

class QeueDto {
  final String name;
  final String phone;
  final String type;
  final String note;
  final String cat;
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
    required this.cat,
    required this.name,
    required this.phone,
    required this.status,
    required this.type,
    required this.note,
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
      cat: data?['cat'] ?? '',
      phone: data?['phone'] ?? '',
      note: data?['note'] ?? '',
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
      'cat': cat,
      'phone': phone,
      'index': index,
      'schedule': schedule,
      'time_in': timein,
      'address': address,
      'status': status,
      'note': note,
      'uid': uid,
      'categoryId': categoryId,
    };
  }

  QueuesEntity toEntity() {
    return QueuesEntity(
      phone: phone,
      uid: uid,
      status: status,
      name: name,
      type: type,
      note: note,
      cat: cat,
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
      cat: entity.cat,
      uid: entity.uid,
      status: entity.status,
      name: entity.name,
      type: entity.type,
      index: entity.index,
      phone: entity.phone,
      schedule: entity.schedule,
      timein: entity.timein,
      catId: entity.catId,
      note: entity.note,
      address: entity.address,
    );
  }
}
