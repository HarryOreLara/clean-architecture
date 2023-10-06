import 'package:tdd_app/core/usecase/usecase.dart';
import 'package:tdd_app/core/utils/typedef.dart';
import 'package:tdd_app/src/authentication/domain/entities/user.dart';
import 'package:tdd_app/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this.authenticationRepository);
  final AuthenticationRepository authenticationRepository;

  @override
  ResultFuture<List<User>> call() async => authenticationRepository.getUsers();
}
