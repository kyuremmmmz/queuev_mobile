import 'package:flutter/material.dart';
import 'package:queingapp/data/models/Auth/login_dto.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';

abstract class RemoteRepositoryDataSource {
  Future<UserDto> createUser(BuildContext context,UserDto user);
  Future<LoginDto> loginUser(BuildContext context,LoginDto user);
}