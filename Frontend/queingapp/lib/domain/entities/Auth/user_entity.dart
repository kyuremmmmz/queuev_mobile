class UserEntity {
  final int? id;
  final String name;
  final String surname;
  final String username;
  final String password;

  UserEntity({
    this.id,
    required this.name,
    required this.password,
    required this.username,
    required this.surname
  });
}


