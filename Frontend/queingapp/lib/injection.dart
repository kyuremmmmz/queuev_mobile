import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:queingapp/data/repositoryImpl/Auth/user_repository_impl.dart';
import 'package:queingapp/data/source/Auth/signup_service.dart';
import 'package:queingapp/domain/repositories/Auth/user_repository.dart';
import 'package:queingapp/domain/usecases/GetAuth/auth_usecases.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/auth_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/storage_provider.dart';
import 'package:queingapp/presentation/provider/AuthenticationProviders/validators_provider.dart';
import 'package:queingapp/presentation/provider/FormProviders/qeue_provider.dart';
import 'package:queingapp/presentation/provider/QrProviders/qr_view_provider.dart';


final GetIt sl = GetIt.instance;

void init(){
  // DATA LAYER
  sl.registerLazySingleton<http.Client>(()=>http.Client());
  sl.registerLazySingleton(()=>SignUpService(client: sl(),storage: sl()));
  
  //REPO
  sl.registerLazySingleton<UserRepository>(()=>UserRepositoryImpl(createUserDataSouce: sl()));
  sl.registerLazySingleton(()=>UserRepositoryImpl(createUserDataSouce: sl()));

  //DOMAIN LAYER
  sl.registerLazySingleton(()=>AuthUsecases(repositoryImpl: sl()));

  //PRESENTATION LAYER
  sl.registerLazySingleton(()=>AuthProvider(authUsecases:sl() ));
  sl.registerLazySingleton(()=>ValidatorsProvider());
  sl.registerLazySingleton(() => QeueProvider());
  sl.registerLazySingleton(()=>StorageProvider());
  sl.registerLazySingleton(()=>QrViewProvider());
}