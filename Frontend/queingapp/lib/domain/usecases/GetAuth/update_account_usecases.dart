// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:queingapp/data/repositoryImpl/Auth/account_repository_impl.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';

class UpdateAccountUsecases {
  final AccountRepositoryImpl repositoryImpl;
  UpdateAccountUsecases({
    required this.repositoryImpl,
  });
  

  Future<UserEntity> callUpdateAccount(UserEntity entity) => repositoryImpl.updateAccount(entity);
}
