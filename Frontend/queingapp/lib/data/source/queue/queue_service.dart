import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/data/models/qeue/qeue_dto.dart';
import 'package:queingapp/data/source/repository/qeueing_repo_data_source.dart';

class QueueService implements QeueingRepoDataSource {
  @override
  Future<QeueDto> createQeue(QeueDto dto) async {
    final database = DB;
    try {
      final querySnapshot = await database
          .collection('queuesList')
          .withConverter(
            fromFirestore: QeueDto.fromJson,
            toFirestore: (QeueDto dto, _) => dto.toJson(),
          )
          .get();

      int newIndex = 1;
      if (querySnapshot.docs.isNotEmpty) {
        final existingIndices = querySnapshot.docs
            .map((doc) => doc.data().index)
            .whereType<int>()
            .toList();
        if (existingIndices.isNotEmpty) {
          newIndex = existingIndices.reduce((a, b) => a > b ? a : b) + 1;
        }
      }

      dto = QeueDto(
        uid: USER.currentUser!.uid,
        status: 'pending',
        name: dto.name,
        type: dto.type,
        index: newIndex,
        schedule: Timestamp.now(),
        timein: Timestamp.now(),
        address: dto.address,
      );
      
      final docRef = await database
          .collection('queuesList')
          .withConverter(
            fromFirestore: QeueDto.fromJson,
            toFirestore: (QeueDto dto, _) => dto.toJson(),
          )
          .add(dto);
      final snapshot = await docRef.get();
      final data = snapshot.data();
      if (data == null) {
        throw Exception("Failed to fetch created queue data.");
      }
      return data;
    } catch (e) {
      throw Exception("Error creating queue: $e");
    }
  }

  

  @override
  Stream<QeueDto?> streamQueueByUid(String uid) {
    return DB
        .collection('queuesList')
        .withConverter(
          fromFirestore: QeueDto.fromJson,
          toFirestore: (QeueDto dto, _) => dto.toJson(),
        )
        .where('uid', isEqualTo: uid)
        .limit(1)
        .snapshots()
        .map((snapshot) {
          if (snapshot.docs.isNotEmpty) {
            return snapshot.docs.first.data();
          }
          return null;
        });
  }

}
