import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:queingapp/data/source/Auth/signup_service.dart';
import 'package:queingapp/data/source/repository/remote_repository_data_source.dart';
import 'package:queingapp/domain/usecases/GetAuth/auth_usecases.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
final sl = GetIt.instance;

void init(){
  // DATA LAYER
  sl.registerLazySingleton<http.Client>(()=>http.Client());
  sl.registerLazySingleton<RemoteRepositoryDataSource>(()=>SignUpService(client: sl()));

  //DOMAIN LAYER
  sl.registerLazySingleton(()=>AuthUsecases(repositoryImpl: sl()));

  //PRESENTATION LAYER
  sl.registerLazySingleton(()=>AuthProvider(authUsecases:sl() ));
}