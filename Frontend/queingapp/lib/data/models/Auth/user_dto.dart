import 'package:queingapp/domain/entities/Auth/user_entity.dart';

class UserDto {
  final int? id;
  final String name;
  final String username;
  final String password;
  final String surname;

  UserDto({
    this.id,
    required this.name,
    required this.password,
    required this.username,
    required this.surname
  });

  factory UserDto.fromJson(Map<String, dynamic> json){
    return UserDto(
      id: json['id'],
      name: json['name'].toString(),
      username: json['username'].toString(),
      password: json['password'].toString(),
      surname: json['surname'].toString(),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'username':username,
      'surname' : surname,
      'password': password
    };
  }
  // This will convert from DTO to Entity
  UserEntity toEntity(){
    return UserEntity(
    id: id,
    surname: surname,
    name: name, 
    password: password, 
    username: username);
  }


  //This static function will convert to DTO
  static UserDto fromEntity(UserEntity user){
    return UserDto(
      id: user.id,
      name: user.name,
      surname: user.surname,
      username: user.username,
      password: user.password
    );
  }
}