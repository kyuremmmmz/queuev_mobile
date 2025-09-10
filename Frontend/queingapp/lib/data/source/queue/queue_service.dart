import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/const.dart';
import 'package:queingapp/data/models/qeue/dynamic_list_dto.dart';
import 'package:queingapp/data/models/qeue/notification_dto.dart';
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
        name: USER.currentUser!.displayName ?? '',
        type: dto.type,
        index: newIndex,
        schedule: Timestamp.now(),
        timein: Timestamp.now(),
        address: dto.address,
      );
      
      final notifDto = NotificationDto(
        notification_id: database.collection('notifications').doc().id,
        notification_type: "queue_created",
        description:"You have been added to the queue for ${dto.type} with number $newIndex.",
        category_id: dto.uid ?? '',
        category_name: dto.type, 
        timestamp: Timestamp.now(),
      );

      final docRef = await database
          .collection('queuesList')
          .withConverter(
            fromFirestore: QeueDto.fromJson,
            toFirestore: (QeueDto dto, _) => dto.toJson(),
          )
          .add(dto);
      await database
          .collection('notifications')
          .withConverter(
            fromFirestore: NotificationDto.fromMap,
            toFirestore: (NotificationDto dto, _) => dto.toMap(),
          )
          .add(notifDto);
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
  
  @override
  Stream<List<QeueDto?>> streamQueueByUidAsList(String uid) {
    return DB.collection('queuesList')
    .withConverter(fromFirestore: QeueDto.fromJson, toFirestore: (QeueDto dto, _) => dto.toJson(),)
    .where('uid', isEqualTo: uid)
    .orderBy('index', descending: false)
    .snapshots().map((snapshot) => snapshot.docs.map((doc)=>doc.data()).toList());
  }

  @override
  Stream<List<DynamicListDto?>> streamCategories(String uid) {
    return DB.
    collection('categories')
    .withConverter(fromFirestore: DynamicListDto.fromMap, toFirestore: (DynamicListDto dto, _) => 
    dto.toMap()).snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data())
    .toList());
  }

}
