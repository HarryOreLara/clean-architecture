import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_app/src/authentication/domain/entities/user.dart';
import 'package:tdd_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_app/src/authentication/domain/usecases/get_users.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository authenticationRepository;
  late GetUsers usecase;

  setUp(() {
    authenticationRepository = MockAuthRepo();
    usecase = GetUsers(authenticationRepository);
  });

  const tResponse = [User.empty()];
  test('should call [AuthRepo -getUsers] and return [List<Users¿>]', () async {
    //Arrange
    when(() => authenticationRepository.getUsers())
        .thenAnswer((_) async => const Right(tResponse));

    //Act
    final result = await usecase();

    expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
    verify(() => authenticationRepository.getUsers()).called(1);
    verifyNoMoreInteractions(authenticationRepository);
  });
}
