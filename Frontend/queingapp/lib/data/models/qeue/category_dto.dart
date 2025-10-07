class CategoryDto {
  final String id;
  final String name;
  final int queueLimit;
  final String timeLimit;

  CategoryDto({
    required this.id,
    required this.name,
    required this.queueLimit,
    required this.timeLimit,
  });

  factory CategoryDto.fromMap(Map<String, dynamic> map) {
    final dynamic q = map['queueLimit'];
    final int qLimit = q is int
        ? q
        : int.tryParse(q?.toString() ?? '') ?? 0;

    return CategoryDto(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      queueLimit: qLimit,
      timeLimit: map['timeLimit'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'queueLimit': queueLimit,
      'timeLimit': timeLimit,
    };
  }
}
