
import 'dart:convert';

import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/repository/remote_repository_data_source.dart';
import 'package:http/http.dart' as http;
class SignUpService implements RemoteRepositoryDataSource{
  final String url = ' http://127.0.0.1:8000/';
  final http.Client client;

  SignUpService({required this.client});
  @override
  Future<UserDto> createUser(UserDto user) async{
    final parseUrl =  Uri.parse('$url/api/signup/POST');
    final response = await client.post(
      parseUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson())
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return UserDto.fromJson(
        jsonDecode(response.body)
      );
    }
    throw Exception(jsonDecode(response.body));
  }

}