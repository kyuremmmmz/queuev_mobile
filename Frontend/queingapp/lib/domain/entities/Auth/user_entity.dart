import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  final int? id;
  final String name;
  final String surname;
  final String username;
  final String password;
  final String birthdate;
  final String email;
  final String phone;

  UserEntity({
    this.id,
    required this.name,
    required this.phone,
    required this.password,
    required this.username,
    required this.surname,
    required this.birthdate,
    required this.email,
  });
}
