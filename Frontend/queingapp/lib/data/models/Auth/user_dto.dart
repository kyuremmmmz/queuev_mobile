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
}