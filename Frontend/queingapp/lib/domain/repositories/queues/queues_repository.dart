import 'package:queingapp/domain/entities/queues/queues_entity.dart';

abstract class QueuesRepository {
  Future<QueuesEntity> createQueues(QueuesEntity entity);
  Stream<QueuesEntity?> getQue(QueuesEntity entity);
  Stream<List<QueuesEntity?>> getQueAsList(QueuesEntity entity);
}
