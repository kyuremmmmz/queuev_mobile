import 'package:queingapp/data/models/Auth/user_dto.dart';

abstract class AccountRepositoryDataSource {
  Future<UserDto> updateAccount(UserDto dto);
  Future<void> deleteAccount();
  Stream<UserDto?> getUser(String uid);
}