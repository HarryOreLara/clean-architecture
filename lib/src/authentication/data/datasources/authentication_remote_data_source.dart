import 'dart:convert';

import 'package:tdd_app/core/errors/exception.dart';
import 'package:tdd_app/core/utils/constants.dart';
import 'package:tdd_app/core/utils/typedef.dart';
import 'package:tdd_app/src/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  Future<List<UserModel>> getUsers();
}

const kCreateUserEndpoint = '/test-api/users';
const kGetUsersEndpoint = '/test-api/users';

class AuthenticationRemoteDataSourceImplementation
    implements AuthenticationRemoteDataSource {
  final http.Client _client;

  AuthenticationRemoteDataSourceImplementation(this._client);

  @override
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    //Check to make sure that it return the right data when the response
    //code is 200 or the proper reponse code
    //Check to make sure that it "THROWS A CUSTOM EXCEPTION" with the
    //Right message when status code is a bad one
    try {
      final response = await _client.post(
          Uri.https('$kBaseUrl$kCreateUserEndpoint'),
          body: jsonEncode(
              {'createdAt': createdAt, 'name': name, 'avatar': avatar}),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response =
          await _client.get(Uri.https(kBaseUrl, kGetUsersEndpoint));

      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((userData) => UserModel.fromMap(userData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
