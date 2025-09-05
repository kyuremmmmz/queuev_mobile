// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:queingapp/const.dart';
import 'package:queingapp/data/models/qeue/qeue_dto.dart';
import 'package:queingapp/data/source/queue/queue_service.dart';
import 'package:queingapp/domain/entities/queues/queues_entity.dart';
import 'package:queingapp/domain/repositories/queues/queues_repository.dart';

class QueueRepositoryImpl implements QueuesRepository {
  final QueueService dataSource;
  QueueRepositoryImpl({required this.dataSource});
  @override
  Future<QueuesEntity> createQueues(QueuesEntity entity) async {
    final dto = QeueDto.fromEntity(entity);
    final data = await dataSource.createQeue(dto);
    return data.toEntity();
  }

  @override
  Stream<QueuesEntity?> getQue(QueuesEntity entity) {
    return dataSource.streamQueueByUid(USER.currentUser!.uid).map((qeueDto) {
      if (qeueDto != null) {
        return qeueDto.toEntity();
      }
      return null;
    });
    
  }
  
  @override
  Stream<List<QueuesEntity?>> getQueAsList(QueuesEntity entity) {
    return dataSource.streamQueueByUidAsList(USER.currentUser!.uid).map((dtoList) {
      return dtoList.map((queueDto){
        if (queueDto != null) {
          return queueDto.toEntity();
        }
        return null;
      }).toList();
    });
  }
}
