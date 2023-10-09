import 'package:tdd_app/src/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource{
  Future<void> createUser({
    required String createdAt,
      required String name,
      required String avatar
  });

  Future<List<UserModel>> getUsers();
}