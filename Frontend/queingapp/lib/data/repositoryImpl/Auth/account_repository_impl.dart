import 'package:queingapp/const.dart';
import 'package:queingapp/data/models/Auth/reset_password_dto.dart';
import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/Auth/account_service.dart';
import 'package:queingapp/domain/entities/Auth/reset_password_entity.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';
import 'package:queingapp/domain/repositories/Auth/update_account_repository.dart';

class AccountRepositoryImpl implements UpdateAccountRepository{
  final dataSource = AccountService();
  @override
  Future<UserEntity> updateAccount(UserEntity entity) async{
    final data = UserDto.fromEntity(entity);
    final account = await dataSource.updateAccount(data);
    return account.toEntity();
  }
  
  @override
  Stream<UserEntity?> getAccount() {
    return dataSource.getUser(USER.currentUser!.uid).map((dto) {
      if (dto != null) {
        return dto.toEntity();
      }
      return null;
    } );
  }

  @override
  Future<void> updatePassword(String password,ResetPasswordEntity entity) async{
    final data = ResetPasswordDto.fromEntity(entity);
    await dataSource.updatePassword(password, data);
  }
  
}