import 'package:queingapp/data/models/qeue/qeue_dto.dart';

abstract class QeueingRepoDataSource {
  Future<QeueDto> createQeue(QeueDto dto);
  Stream<QeueDto?> streamQueueByUid(String uid);
}
