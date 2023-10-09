import 'package:dartz/dartz.dart';
import 'package:tdd_app/core/errors/exception.dart';
import 'package:tdd_app/core/errors/failure.dart';
import 'package:tdd_app/core/utils/typedef.dart';
import 'package:tdd_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:tdd_app/src/authentication/domain/entities/user.dart';
import 'package:tdd_app/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  const AuthenticationRepositoryImplementation(
      this.authenticationRemoteDataSource);

  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    try {
      await authenticationRemoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      return const Right(null);
    } on APIException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await authenticationRemoteDataSource.getUsers();
      return Right(result);
    } on APIException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
