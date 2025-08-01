import 'package:equatable/equatable.dart';
import 'package:healthy_mind_application/core/user_module/domain/entities/user_entity.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? avatar;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  static final empty = UserModel(id: '', name: '', email: '', avatar: '');

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  UserEntity toEntity() {
    return UserEntity(id: id, name: name, email: email, avatar: avatar);
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      avatar: entity.avatar,
    );
  }

  @override
  List<Object?> get props => [id, name, email, avatar];
}
