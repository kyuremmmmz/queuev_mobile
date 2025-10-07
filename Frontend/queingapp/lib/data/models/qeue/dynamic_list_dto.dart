import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/domain/entities/queues/queue_dynamic_entity.dart';
import 'category_dto.dart';

class DynamicListDto {
  final String categoryId;
  final String catId;
  final String name;
  final String note;
  final String queueId;
  final String role;
  final String user;
  final int code;
  final Map<String, dynamic> breaktime;
  final Map<String, dynamic> expiration;
  final Map<String, dynamic> schedule;
  final String address;
  final List<CategoryDto> categories;

  DynamicListDto({
    required this.categoryId,
    required this.catId,
    required this.name,
    required this.note,
    required this.queueId,
    required this.role,
    required this.user,
    required this.code,
    required this.breaktime,
    required this.expiration,
    required this.schedule,
    required this.address,
    required this.categories,
  });

  factory DynamicListDto.fromMap(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data()!;
    return DynamicListDto(
      categoryId: data['categoryId'] as String? ?? '',
      name: data['name'] as String? ?? '',
      note: data['note'] as String? ?? '',
      queueId: data['queueId'] as String? ?? '',
      role: data['role'] as String? ?? '',
      user: data['user'] as String? ?? '',
      code: (data['code'] is int) ? data['code'] as int : int.tryParse(data['code']?.toString() ?? '') ?? 0,
      breaktime: Map<String, dynamic>.from(data['breaktime'] as Map? ?? {}),
      expiration: Map<String, dynamic>.from(data['expiration'] as Map? ?? {}),
      schedule: Map<String, dynamic>.from(data['schedule'] as Map? ?? {}),
      address: data['address'] as String? ?? '',
      categories: (data['categories'] as List<dynamic>? ?? [])
          .map((cat) => CategoryDto.fromMap(cat as Map<String, dynamic>))
          .toList(), 
      catId: data['catId'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'catId': catId,
      'name': name,
      'note': note,
      'queueId': queueId,
      'role': role,
      'user': user,
      'code': code,
      'breaktime': breaktime,
      'expiration': expiration,
      'schedule': schedule,
      'address': address,
      'categories': categories.map((c) => c.toMap()).toList(),
    };
  }

  static DynamicListDto fromEntity(QueueDynamicEntity entity) {
    return DynamicListDto(
      categoryId: entity.categoryId,
      name: entity.name,
      note: '',
      queueId: entity.queueId,
      role: entity.role,
      user: '',
      code: entity.code,
      breaktime: {},
      expiration: {},
      schedule: {},
      address: entity.address,
      categories: entity.categories, catId: entity.catId,
    );
  }

  QueueDynamicEntity toEntity() {
    return QueueDynamicEntity(
      catId: catId,
      address: address,
      categoryId: categoryId,
      name: name,
      queueId: queueId,
      role: role,
      code: code,
      categories: categories,
    );
  }
}
