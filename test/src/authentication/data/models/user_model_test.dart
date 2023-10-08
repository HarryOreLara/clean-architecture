import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app/core/utils/typedef.dart';
import 'package:tdd_app/src/authentication/data/models/user_model.dart';
import 'package:tdd_app/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();

  test('Should be a subclass of [User] entity', () {
    //Arrange

    //Act
    //Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('Should return a [UserModel] with the right data', () {
      //Act
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('Should return a [UserModel] with the right data', () {
      //Act
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('Should return a [map] with the right data', () {
      final restul = tModel.toMap();
      expect(restul, equals(tMap));
    });
  });

  group('toJson', () {
    test('Shoul return a [JSON] string with the right data', () {
      //Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "avatar": "_empty_avatar",
        "createdAt": "_empty_createdAt",
        "name": "_empty_name"
      });

      //Assert
      expect(result, tJson);
    });
  });

  group('CopyWith', () { 
    test('Should return a [UserModel] with diferent data', () {
      final result = tModel.copyWith(name: 'Paul');
      expect(result.name, equals('Paul'));
    });
  });

}
