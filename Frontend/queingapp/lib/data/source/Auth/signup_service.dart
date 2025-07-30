
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:queingapp/data/models/Auth/login_dto.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/repository/remote_repository_data_source.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';


class SignUpService implements RemoteRepositoryDataSource{
  final String url = 'http://192.168.100.7:8000';
  final http.Client client;
  final StorageProvider storage;
  SignUpService( {required this.storage ,required this.client});
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
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      String? token = data['data']['token'];
      if (token == null) {
        throw Exception("No Token Found");
      }
      await storage.writeSecureToken(token);
      print(jsonDecode(response.body));
      return LoginDto.fromJson(
        jsonDecode(response.body)
      );
    }
    print(jsonDecode(response.body));
    throw Exception(jsonDecode(response.body));
  }

}