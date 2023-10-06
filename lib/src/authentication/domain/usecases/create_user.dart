import 'package:equatable/equatable.dart';
import 'package:tdd_app/core/usecase/usecase.dart';
import 'package:tdd_app/core/utils/typedef.dart';
import 'package:tdd_app/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  final AuthenticationRepository authenticationRepository;

  CreateUser(this.authenticationRepository);

  @override
  ResultVoid call(CreateUserParams params) async =>
      authenticationRepository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar);
}

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;
  

  const CreateUserParams.empty()
      : this(
            createdAt: '_empty_createdAt',
            name: '_empty_name',
            avatar: '_empty_avatar');



  const CreateUserParams(
      {required this.createdAt, required this.name, required this.avatar});

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
