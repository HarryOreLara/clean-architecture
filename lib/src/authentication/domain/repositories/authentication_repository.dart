
import 'package:tdd_app/core/utils/typedef.dart';
import 'package:tdd_app/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  // Future<Either<Failure, List<User>>> getUsers();
  ResultFuture<List<User>> getUsers();



}


