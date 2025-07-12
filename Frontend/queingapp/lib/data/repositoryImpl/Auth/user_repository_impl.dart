import 'package:queingapp/data/models/Auth/user_dto.dart';
import 'package:queingapp/data/source/Auth/signup_service.dart';
import 'package:queingapp/domain/entities/Auth/user_entity.dart';
import 'package:queingapp/domain/repositories/Auth/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final SignUpService createUserDataSouce;

  UserRepositoryImpl({
    required this.createUserDataSouce
  });
  @override
  Future<UserEntity> createUser(UserEntity user) async{
    final dto = UserDto.fromEntity(user);
    final response = await createUserDataSouce.createUser(dto);
    return response.toEntity();
  }
 }