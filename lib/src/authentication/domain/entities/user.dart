import 'package:equatable/equatable.dart';


class User extends Equatable {
  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  const User.empty()
      : this(
            id: "1",
            createdAt: '_empty_createdAt',
            name: '_empty_name',
            avatar: '_empty_avatar');

  const User(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.avatar});

  @override
  List<Object?> get props => [id, name, avatar];

}
