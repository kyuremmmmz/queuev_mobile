import 'package:queingapp/data/models/Auth/user_dto.dart';

abstract class RemoteRepositoryDataSource {
  Future<UserDto> createUser(UserDto user);
}