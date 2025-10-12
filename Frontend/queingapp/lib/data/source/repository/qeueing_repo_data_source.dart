import 'package:flutter/material.dart';
import 'package:queingapp/data/models/qeue/dynamic_list_dto.dart';
import 'package:queingapp/data/models/qeue/qeue_dto.dart';

abstract class QeueingRepoDataSource {
  Future<QeueDto> createQeue(QeueDto dto, BuildContext context);
  Stream<QeueDto?> streamQueueByUid(String uid);
  Stream<List<QeueDto?>> streamQueueByUidAsList(String uid);
  Stream<List<DynamicListDto?>> streamCategories(String uid);
  Stream<List<DynamicListDto?>> streamCategoriesByCode(int code);
  Future<List<DynamicListDto?>> getCategoriesByCode(String code, BuildContext context);
}
