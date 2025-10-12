import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

class UserDto {
  final String? id;
  final String name;
  final String username;
  final String? password;
  final String? address;
  final String surname;
  final String email;
  final String phone;
  final String? role;
  UserDto({
    this.id,
    this.role,
    required this.name,
    this.password,
    this.address,
    required this.username,
    required this.surname,
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
      role: data?['role'],
      username: data?['username'],
      password: data?['password'],
      surname: data?['surname'],
      address: data?['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': FirebaseAuth.instance.currentUser!.uid,
      'name': name,
      'username': username,
      'surname': surname,
      'role': 'user',
      'password': password,
      'email': email,
      'address': address,
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
      email: email,
      phone: phone,
      address: address,
    );
  }

  //This static function will convert to DTO
  static UserDto fromEntity(UserEntity user) {
    return UserDto(
      phone: user.phone,
      id: user.id,
      name: user.name,
      surname: user.surname ?? '',
      username: user.username,
      password: user.password,
      email: user.email ?? '',
      address: user.address,
    );
  }
}
