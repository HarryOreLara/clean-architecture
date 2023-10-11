import 'package:get_it/get_it.dart';
import 'package:tdd_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:tdd_app/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:tdd_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_app/src/authentication/domain/usecases/create_user.dart';
import 'package:tdd_app/src/authentication/domain/usecases/get_users.dart';
import 'package:tdd_app/src/authentication/presentation/bloc/cubit/authentication_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.asNewInstance();

Future<void> init() async {
  sl
  //APP LOGIG
    ..registerFactory(
        () => AuthenticationCubit(createUser: sl(), getUsers: sl()))
  //Use cases
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => GetUsers(sl()))

    //Respositories
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImplementation(sl()))

    //Datasources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImplementation(sl()))

    //External Dependencies
    ..registerLazySingleton(http.Client.new);
}
