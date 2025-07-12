import 'package:queingapp/domain/entities/Auth/user_entity.dart';

class UserDto {
  final String? id;
  final String? name;
  final String? username;
  final String? password;

  UserDto({
    this.id,
    this.name,
    this.password,
    this.username
  });

  factory UserDto.fromJson(Map<String, dynamic> json){
    return UserDto(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      password: json['password'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'username':username,
      'password': password
    };
  }
  // This will convert from DTO to Entity
  UserEntity toEntity(){
    return UserEntity(
    id: id,
    name: name as String, 
    password: password as String, 
    username: username as String);
  }


  //This static function will convert to DTO
  static UserDto fromEntity(UserEntity user){
    return UserDto(
      id: user.id,
      name: user.name,
      username: user.username,
      password: user.password
    );
  }
}