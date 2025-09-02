import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  final int? id;
  final String name;
  final String? surname;
  final String username;
  final String? password;
  final String birthdate;
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
    required this.birthdate,
    this.email,
  });
}
