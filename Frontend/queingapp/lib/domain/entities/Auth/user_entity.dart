
class UserEntity {
  final String? id;
  final String name;
  final String? surname;
  final String username;
  final String? password;
  final String? email;
  final String phone;
  final String?  address;

  UserEntity({
    this.address,
    this.id,
    required this.name,
    required this.phone,
    this.password,
    required this.username,
    this.surname,
    this.email,
  });
}
