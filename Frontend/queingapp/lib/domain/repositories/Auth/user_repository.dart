import 'package:queingapp/domain/entities/Auth/login_entity.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> createUser(UserEntity user);
  Future<LoginEntity> loginUser(LoginEntity user);
}