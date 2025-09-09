import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:queingapp/domain/entities/Auth/reset_password_entity.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

abstract class UpdateAccountRepository {
  Future<UserEntity> updateAccount(BuildContext context,UserEntity entity);
  Future<void> updatePassword(BuildContext context,String password ,ResetPasswordEntity entity);
  Stream<UserEntity?> getAccount();
}