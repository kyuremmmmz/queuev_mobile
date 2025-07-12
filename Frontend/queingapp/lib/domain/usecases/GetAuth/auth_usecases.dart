import 'package:queingapp/data/repositoryImpl/Auth/user_repository_impl.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

class AuthUsecases {
  final UserRepositoryImpl repositoryImpl;

  AuthUsecases({
    required this.repositoryImpl
  });

  Future<UserEntity> callcreateUser(UserEntity user) async {
    return await repositoryImpl.createUser(user);
  }
}