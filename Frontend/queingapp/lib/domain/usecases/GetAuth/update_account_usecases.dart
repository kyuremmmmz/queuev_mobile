// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:queingapp/data/models/Auth/reset_password_dto.dart';
import 'package:queingapp/data/repositoryImpl/Auth/account_repository_impl.dart';
import 'package:queingapp/domain/entities/Auth/reset_password_entity.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

class UpdateAccountUsecases {
  final AccountRepositoryImpl repositoryImpl;
  UpdateAccountUsecases({
    required this.repositoryImpl,
  });
  

  Future<UserEntity> callUpdateAccount(BuildContext context,UserEntity entity) => repositoryImpl.updateAccount(context ,entity);
  Stream<UserEntity?> callgetAccount() => repositoryImpl.getAccount();
  Future<void> callupdatePassword(BuildContext context,String password, ResetPasswordEntity entity) => repositoryImpl.updatePassword(context ,password, entity);
}
