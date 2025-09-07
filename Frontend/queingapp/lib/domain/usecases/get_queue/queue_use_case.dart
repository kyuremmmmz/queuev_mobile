// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:queingapp/data/repositoryImpl/queue/queue_repository_impl.dart';
import 'package:queingapp/domain/entities/queues/queue_dynamic_entity.dart';
import 'package:queingapp/domain/entities/queues/queues_entity.dart';

class QueueUseCase {
  final QueueRepositoryImpl repositoryImpl;
  QueueUseCase({required this.repositoryImpl});

  Future<QueuesEntity> callCreateQueue(QueuesEntity entity) async {
    return await repositoryImpl.createQueues(entity);
  }

  Stream<QueuesEntity?> callGetQueue(QueuesEntity entity) {
    return repositoryImpl.getQue(entity);
  }

  Stream<List<QueuesEntity?>> callGetQueueAsList(QueuesEntity entity) {
    return repositoryImpl.getQueAsList(entity);
  }

  Stream<List<QueueDynamicEntity?>> callDynamicButtons() {
    return repositoryImpl.getDynamicList();
  }
}
