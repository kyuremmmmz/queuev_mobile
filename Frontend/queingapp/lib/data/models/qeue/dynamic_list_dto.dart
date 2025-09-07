// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/domain/entities/queues/queue_dynamic_entity.dart';

class DynamicListDto {
  final String categoryId;
  final String createdAt;
  final String limit;
  final String name;
  final String queueId;
  final String timeLimit;
  DynamicListDto({
    required this.categoryId,
    required this.createdAt,
    required this.limit,
    required this.name,
    required this.queueId,
    required this.timeLimit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'createdAt': createdAt,
      'limit': limit,
      'name': name,
      'queueId': queueId,
      'timeLimit': timeLimit,
    };
  }

  factory DynamicListDto.fromMap(DocumentSnapshot<Map<String, dynamic>> map, SnapshotOptions? json ) {
    return DynamicListDto(
      categoryId: map['categoryId'] as String,
      createdAt: map['createdAt'] as String,
      limit: map['limit'] as String,
      name: map['name'] as String,
      queueId: map['queueId'] as String,
      timeLimit: map['timeLimit'] as String,
    );
  }


  QueueDynamicEntity toEntity(){
    return QueueDynamicEntity(categoryId: categoryId, createdAt: createdAt, limit: limit, name: name, queueId: queueId, timeLimit: timeLimit);
  }

  static DynamicListDto fromEntity(QueueDynamicEntity entity){
    return DynamicListDto(categoryId: entity.categoryId, createdAt: entity.createdAt, limit: entity.limit, name: entity.name, queueId: entity.queueId, timeLimit: entity.timeLimit);
  }

}
