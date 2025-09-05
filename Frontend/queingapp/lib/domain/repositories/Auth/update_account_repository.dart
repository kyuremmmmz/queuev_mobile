import 'package:firebase_auth/firebase_auth.dart';
import 'package:queingapp/domain/entities/Auth/reset_password_entity.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

abstract class UpdateAccountRepository {
  Future<UserEntity> updateAccount(UserEntity entity);
  Future<void> updatePassword(String password ,ResetPasswordEntity entity);
  Stream<UserEntity?> getAccount();
}