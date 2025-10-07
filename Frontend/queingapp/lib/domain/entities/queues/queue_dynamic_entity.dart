import 'package:queingapp/data/models/qeue/category_dto.dart';

class QueueDynamicEntity {
  final String categoryId;
  final String catId;
  final String name;
  final String queueId;
  final String role;
  final String address;
  final int code;
  final List<CategoryDto> categories;

  QueueDynamicEntity({
    required this.categoryId,
    required this.address,
    required this.name,
    required this.queueId,
    required this.role,
    required this.code,
    required this.categories,
    required this.catId
    ,
  });
}
