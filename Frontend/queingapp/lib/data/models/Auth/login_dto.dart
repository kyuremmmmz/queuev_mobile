// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queingapp/domain/entities/Auth/login_entity.dart';

class LoginDto {
  final String username;
  final String password;
  LoginDto({
    required this.username,
    required this.password,
  });

  factory LoginDto.fromJson(
    DocumentSnapshot<Map<String, dynamic>> json,
    SnapshotOptions? snapshot,
  ) {
    final data = json.data();
    return LoginDto(
      username: data?['username'],
      password: data?['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password,};
  }

  //convert DTO to Entity
  LoginEntity toEntity() {
    return LoginEntity(username: username, password: password);
  }

  // convert entity to DTO
  static LoginDto fromEntity(LoginEntity user) {
    return LoginDto(
      username: user.username,
      password: user.password,
    );
  }
}
