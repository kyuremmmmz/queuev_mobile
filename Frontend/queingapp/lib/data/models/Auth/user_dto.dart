import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

class UserDto {
  final int? id;
  final String name;
  final String username;
  final String password;
  final String surname;
  final String birthDate;
  final String email;
  final String phone;

  UserDto({
    this.id,
    required this.name,
    required this.password,
    required this.username,
    required this.surname,
    required this.birthDate,
    required this.email,
    required this.phone,
  });

  factory UserDto.fromJson(
    DocumentSnapshot<Map<String, dynamic>> json,
    SnapshotOptions? snapshot,
  ) {
    final data = json.data();
    return UserDto(
      phone: data?['phone'],
      email: data?['email'],
      id: data?['id'],
      name: data?['name'],
      username: data?['username'],
      password: data?['password'],
      surname: data?['surname'],
      birthDate: data?['birthdate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'surname': surname,
      'password': password,
      'email': email,
      'birthdate': birthDate,
      'phone': phone,
    };
  }

  // This will convert from DTO to Entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      surname: surname,
      name: name,
      password: password,
      username: username,
      birthdate: birthDate,
      email: email,
      phone: phone,
    );
  }

  //This static function will convert to DTO
  static UserDto fromEntity(UserEntity user) {
    return UserDto(
      phone: user.phone,
      id: user.id,
      name: user.name,
      surname: user.surname,
      username: user.username,
      password: user.password,
      birthDate: user.birthdate,
      email: user.email
    );
  }
}
