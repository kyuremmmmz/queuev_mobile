import 'package:flutter/material.dart';
import 'package:queingapp/domain/entities/queues/queue_dynamic_entity.dart';
import 'package:queingapp/domain/entities/queues/queues_entity.dart';

abstract class QueuesRepository {
  Future<QueuesEntity> createQueues(QueuesEntity entity, BuildContext context);
  Stream<QueuesEntity?> getQue(QueuesEntity entity);
  Stream<List<QueuesEntity?>> getQueAsList(QueuesEntity entity);
  Stream<List<QueueDynamicEntity?>> getDynamicList(String uid);
  Stream<List<QueueDynamicEntity?>> getDynamicListCode(int code);
}
