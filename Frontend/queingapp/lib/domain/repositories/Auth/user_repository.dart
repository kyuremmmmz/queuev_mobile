import 'package:flutter/material.dart';
import 'package:queingapp/domain/entities/Auth/login_entity.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> createUser(BuildContext context,UserEntity user);
  Future<LoginEntity> loginUser(BuildContext context,LoginEntity user);
}