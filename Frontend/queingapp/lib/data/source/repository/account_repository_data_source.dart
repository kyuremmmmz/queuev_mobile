import 'package:queingapp/data/models/Auth/reset_password_dto.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';

abstract class AccountRepositoryDataSource {
  Future<UserDto> updateAccount(UserDto dto);
  Future<void> updatePassword(String password, ResetPasswordDto dto);
  Future<void> deleteAccount();
  Stream<UserDto?> getUser(String uid);
}