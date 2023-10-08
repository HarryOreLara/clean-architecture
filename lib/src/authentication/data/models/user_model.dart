import 'dart:convert';

import 'package:tdd_app/core/utils/typedef.dart';
import 'package:tdd_app/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.avatar,
    required super.id,
    required super.createdAt,
    required super.name,
  });

  const UserModel.empty()
      : this(
            id: "1",
            createdAt: '_empty_createdAt',
            name: '_empty_name',
            avatar: '_empty_avatar');

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
            avatar: map['avatar'] as String,
            id: map['id'] as String,
            createdAt: map['createdAt'] as String,
            name: map['name'] as String);

  UserModel copyWith(
      {String? avatar, String? id, String? createdAt, String? name}) {
    return UserModel(
        avatar: avatar ?? this.avatar,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name);
  }

  DataMap toMap() =>
      {'id': id, 'avatar': avatar, 'createdAt': createdAt, 'name': name};

  String toJson() => jsonEncode(toMap());



  // UserModel userModelFromJson(String source) {
  //   final Map<String, dynamic> jsonData = jsonDecode(source);
  //   return UserModel.fromMap(jsonData);
  // }


}
