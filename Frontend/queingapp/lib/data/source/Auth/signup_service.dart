import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:queingapp/data/models/Auth/login_dto.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/repository/remote_repository_data_source.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';

class SignUpService implements RemoteRepositoryDataSource {
  final String url = 'http://192.168.100.7:8000';
  final http.Client client;
  final StorageProvider storage;

  SignUpService({required this.client, required this.storage});

  @override
  Future<UserDto> createUser(UserDto user) async {
    final parseUrl = Uri.parse('$url/api/signup');
    final response = await client.post(
      parseUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    debugPrint('SignUp response status: ${response.statusCode}');
    debugPrint('SignUp response body: ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      debugPrint('SignUp parsed JSON: ${jsonDecode(response.body)}');
      return UserDto.fromJson(jsonDecode(response.body));
    }
    debugPrint('SignUp error: ${jsonDecode(response.body)}');
    throw Exception(jsonDecode(response.body));
  }

  @override
  Future<LoginDto> loginUser(LoginDto user) async {
    final parseUrl = Uri.parse('$url/api/login');
    final response = await client.post(
      parseUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    debugPrint('Login response status: ${response.statusCode}');
    debugPrint('Login response body: ${response.body}');

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      debugPrint('Login parsed JSON: $data');
      final token = data['data']['token']?.toString();
      if (token == null || token.isEmpty) {
        throw Exception('No Token Found');
      }
      await storage.writeSecureToken(token);
      debugPrint('Token stored in SignUpService: $token');
      return LoginDto.fromJson(data);
    }
    debugPrint('Login error: ${jsonDecode(response.body)}');
    throw Exception(jsonDecode(response.body));
  }
}