
import 'dart:convert';

import 'package:queingapp/data/models/Auth/login_dto.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/repository/remote_repository_data_source.dart';
import 'package:http/http.dart' as http;
class SignUpService implements RemoteRepositoryDataSource{
  final String url = 'http://192.168.100.7:8000';
  final http.Client client;

  SignUpService({required this.client});
  @override
  Future<UserDto> createUser(UserDto user) async{
    final parseUrl =  Uri.parse('http://192.168.100.7:8000/api/signup');
    final response = await client.post(
      parseUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson())
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print(jsonDecode(response.body));
      return UserDto.fromJson(
        jsonDecode(response.body)
      );
    }
    throw Exception(jsonDecode(response.body));
  }

  @override
  Future<LoginDto> loginUser(LoginDto user) async{
    final parseUrl = Uri.parse('http://192.168.100.7:8000/api/login');
    final response = await client.post(parseUrl, 
    headers: {
      'Content-Type':'application/json'
    },
    body: jsonEncode(user.toJson()
      )
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return LoginDto.fromJson(
        jsonDecode(response.body)
      );
    }
    print(jsonDecode(response.body));
    throw Exception(jsonDecode(response.body));
  }

}