// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:queingapp/domain/entities/Auth/login_entity.dart';

class LoginDto {
  final String username;
  final String password;
  LoginDto({
    required this.username,
    required this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json){
    return LoginDto(
      username: json['username'], 
      password: json['password']);
  }

  Map<String, dynamic> toJson(){
    return {
      'username':username,
      'password':password
    };
  }

  //convert DTO to Entity
  LoginEntity toEntity(){
    return LoginEntity(
    username: username, 
    password: password
    );
  }

  // convert entity to DTO
  static LoginDto fromEntity(LoginEntity user){
    return LoginDto(
      username: user.username, 
      password: user.password);
  }
}
