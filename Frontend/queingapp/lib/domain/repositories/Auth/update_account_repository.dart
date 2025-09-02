import 'package:firebase_auth/firebase_auth.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

abstract class UpdateAccountRepository {
  Future<UserEntity> updateAccount(UserEntity entity);
}