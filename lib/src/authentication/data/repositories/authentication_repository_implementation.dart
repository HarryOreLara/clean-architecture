import 'package:tdd_app/core/utils/typedef.dart';
import 'package:tdd_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:tdd_app/src/authentication/domain/entities/user.dart';
import 'package:tdd_app/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository{

  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  const AuthenticationRepositoryImplementation(this.authenticationRemoteDataSource);

  @override
  ResultVoid createUser({required String createdAt, required String name, required String avatar}) async {
        // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}