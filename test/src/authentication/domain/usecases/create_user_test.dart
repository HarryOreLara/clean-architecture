//What does the class depende on
//Answer -- AuthentcationRepository
//How can we create a fake verson of the dependency
//Answer -- Use Mocktail
//How do we control what our dependencies do
//Answer -- Using the Mocktail's APIs

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_app/core/errors/failure.dart';
import 'package:tdd_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_app/src/authentication/domain/usecases/create_user.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late CreateUser usecase;
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthRepo();
    usecase = CreateUser(authenticationRepository);
  });

  const params = CreateUserParams.empty();

  test('Should call the [Repository - createUser]', () async {
    //Arrange
    //STUB
    when(() => authenticationRepository.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar')))
        .thenAnswer((invocation) async => const Right(null));

    //Act
    final result = await usecase(params);

    //Assert
    expect(result, equals(const Right<Failure, void>(null)));
    verify(
      () => authenticationRepository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar),
    ).called(1);

    verifyNoMoreInteractions(authenticationRepository);
  });
}
